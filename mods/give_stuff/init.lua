minetest.register_on_newplayer(function(player)
	player:get_inventory():add_item('main', 'default:pickaxe')
	player:get_inventory():add_item('main', 'default:machinegun')
	player:get_inventory():add_item('main', 'default:sniper_rifle')
	player:get_inventory():add_item('main', 'default:rocketlauncher')
	player:get_inventory():add_item('main', 'default:handgun')
	player:get_inventory():add_item('main', 'default:hgmunition 50')
	player:get_inventory():add_item('main', 'default:mgmunition 100')
	player:get_inventory():add_item('main', 'default:srmunition 15')
	player:get_inventory():add_item('main', 'default:rocketmunition 3')
end)
