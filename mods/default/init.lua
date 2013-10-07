LIGHT_MAX = 14

default = {}

dofile(minetest.get_modpath("default").."/mapgen.lua")

minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "This is War of Blocks!")
	end
	minetest.after(2.0, cb, player)
end)

BULLET_DAMAGE=5
BULLET_VELOCITY=19
BULLET_GRAVETY=0.000001

default_shoot_bullet=function (item, player, pointed_thing)
        -- Check if blocks in Inventory and remove one of them
        local i=1
        if player:get_inventory():contains_item("main", "default:block") then
                player:get_inventory():remove_item("main", "default:block")
                -- Shoot Arrow
                local playerpos=player:getpos()
                local obj=minetest.env:add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, "default:bullet_entity")
                local dir=player:get_look_dir()
                obj:setvelocity({x=dir.x*BULLET_VELOCITY, y=dir.y*BULLET_VELOCITY, z=dir.z*BULLET_VELOCITY})
                obj:setacceleration({x=dir.x*-3, y=-BULLET_GRAVETY, z=dir.z*-3})
        end
        return
end

-- The Bullet Entity

DEFAULT_BULLET_ENTITY={
        physical = false,
        timer=0,
        textures = {"bullet.png"},
        lastpos={},
        collisionbox = {0,0,0,0,0,0},
}


-- Bullet_entity.on_step()--> called when bullet is moving
DEFAULT_BULLET_ENTITY.on_step = function(self, dtime)
        self.timer=self.timer+dtime
        local pos = self.object:getpos()
        local node = minetest.env:get_node(pos)

        -- When bullet is away from player (after 0.2 seconds): Cause damage to mobs and players
        if self.timer>50 then
                local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
                for k, obj in pairs(objs) do
                        obj:set_hp(obj:get_hp()-BULLET_DAMAGE)
                        if obj:get_entity_name() ~= "default:bullet_entity" then
                                if obj:get_hp()<=0 then
                                        obj:remove()
                                end
                                self.object:remove()
                        end
                end
        end

        -- Become item when hitting a node
        if self.lastpos.x~=nil then --If there is no lastpos for some reason
                if node.name ~= "air" then
                        minetest.env:add_item(self.lastpos, 'craft "default:bullet" 1')
                        self.object:remove()
                end
        end
        self.lastpos={x=pos.x, y=pos.y, z=pos.z} -- Set lastpos-->Item will be added at last pos outside the node
end

minetest.register_entity("default:bullet_entity", DEFAULT_BULLET_ENTITY)

-- weapons

-- sniper rifle

minetest.register_tool("default:sniper_rifle", {
	description = "Sniper rifle",
	inventory_image = "sniper_rifle.png",
	tool_capabilities = {
		max_drop_level=0,
	}
})

-- machinegun

minetest.register_tool("default:machinegun", {
        description = "Machinegun",
        inventory_image = "machinegun.png",
        tool_capabilities = {
                max_drop_level=0,
        }
})

-- handgun

minetest.register_tool("default:handgun", {
        description = "Handgun",
        inventory_image = "handgun.png",
	on_use = default_shoot_bullet,
        tool_capabilities = {
                max_drop_level=0,
        }
})

-- rocketlauncher

minetest.register_tool("default:rocketlauncher", {
        description = "Rockerlauncher",
        inventory_image = "rocketlauncher.png",
        tool_capabilities = {
                max_drop_level=0,
        }
})

-- pickaxe

minetest.register_tool("default:pickaxe", {
        description = "Pickaxe",
        inventory_image = "pickaxe.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps = {
			dig={times={[1]=0.0} ,uses=0, maxlevel=1},
		}
        }
})


-- Blocks

minetest.register_node("default:block", {
	description = "Block",
	tiles ={"block.png"},
	is_ground_conect = true,
	groups = {dig=1},
	drop = 'default:block',

})

minetest.register_node("default:leaveblock", {
        description = "Leave-Block",
        tiles ={"leaveblock.png"},
        is_ground_conect = true,
        groups = {dig=1},
        drop = 'default:block',

})
minetest.register_node("default:woodblock", {
        description = "Wood-Block",
        tiles ={"woodblock.png"},
        is_ground_conect = true,
        groups = {dig=1},
        drop = 'default:block',

})

-- Aliases for the map generator outputs

minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "default:block")
minetest.register_alias("mapgen_tree", "default:woodblock")
minetest.register_alias("mapgen_leaves", "default:leaveblock")
minetest.register_alias("mapgen_apple", "default:leaveblock")
minetest.register_alias("mapgen_water_source", "default:block")
minetest.register_alias("mapgen_dirt", "default:block")
minetest.register_alias("mapgen_sand", "default:block")
minetest.register_alias("mapgen_gravel", "default:block")
minetest.register_alias("mapgen_clay", "default:block")
minetest.register_alias("mapgen_lava_source", "default:block")
minetest.register_alias("mapgen_cobble", "default:block")
minetest.register_alias("mapgen_mossycobble", "default:block")
minetest.register_alias("mapgen_dirt_with_grass", "default:block")
minetest.register_alias("mapgen_junglegrass", "default:air")
minetest.register_alias("mapgen_stone_with_coal", "default:block")
minetest.register_alias("mapgen_stone_with_iron", "default:block")
minetest.register_alias("mapgen_mese", "default:block")
minetest.register_alias("mapgen_stair_cobble", "default:block")




-- Global callbacks


-- Global environment step function
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)

function on_placenode(p, node)
	--print("on_placenode")
end
minetest.register_on_placenode(on_placenode)

function on_dignode(p, node)
	--print("on_dignode")
end
minetest.register_on_dignode(on_dignode)

function on_punchnode(p, node)
end
minetest.register_on_punchnode(on_punchnode)



