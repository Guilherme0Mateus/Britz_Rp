fx_version 'bodacious'
games { 'gta5' }

author 'Trigueiro'
description 'Trocar pneu'
version '1.0.0'


client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    'client.lua'
}
server_script {
    "@vrp/lib/utils.lua",
    'server.lua'
}


