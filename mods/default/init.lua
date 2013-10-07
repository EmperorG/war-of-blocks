LIGHT_MAX = 14

default = {}

dofile(minetest.get_modpath("default").."/mapgen.lua")

minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "This is War of Blocks!")
	end
	minetest.after(2.0, cb, player)
end)


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

-- Aliases for the map generator outputs

minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "default:block")
minetest.register_alias("mapgen_tree", "default:air")
minetest.register_alias("mapgen_leaves", "default:air")
minetest.register_alias("mapgen_apple", "default:air")
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
