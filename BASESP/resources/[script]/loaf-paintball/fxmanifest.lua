fx_version 'adamant'
games {'gta5'}

client_scripts {
	"@vrp/lib/utils.lua",
    'config.lua',
    'client.lua'
}

server_scripts {
	"@vrp/lib/utils.lua",
    'config.lua',
    'server.lua'
}
shared_script "@ThunderAC/natives.lua"