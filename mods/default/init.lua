LIGHT_MAX = 14

default = {}

dofile(minetest.get_modpath("/mapgenerator.lua")

minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "This is War of Blocks!")
	end
	minetest.after(2.0, cb, player)
end)


-- weapons

-- sniper rifle

minetest.register_item("sniper_rifle", {
	description = "Sniper rifle",
	inventory_image = "sniper_rifle.png",
	tool_capabilities = {
		max_drop_level=0,
	}
})

-- machinegun

minetest.register_item("machinegun", {
        description = "Machinegun",
        inventory_image = "machinegun.png",
        tool_capabilities = {
                max_drop_level=0,
        }
})

-- handgun

minetest.register_item("handgun", {  
        description = "Handgun",  
        inventory_image = "handgun.png",  
        tool_capabilities = {
                max_drop_level=0,
        }
})

-- rocketlauncher

minetest.register_item("rocketlauncher", {
        description = "Rockerlauncher",  
        inventory_image = "rocketlauncher.png",
        tool_capabilities = {
                max_drop_level=0,
        } 
})

-- pickaxe

minetest.register_item("pickaxe", {
        description = "pickaxe",
        inventory_image = "pickaxe.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
                max_drop_level=0,
		groupcaps = {
			digable={times={[0]=0.00 ,uses=0, maxlevel=1}
		}
        } 
})


-- Blocks

minetest.register_node("block", {
	description = "Block",
	tiles ={"block.png"},
	is_ground_conect = true,
	groups = {digable=0}
			

-- Aliases for the map generator outputs

minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_block", "block")

-- Global callbacks
--

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
