fx_version 'bodacious'
games { 'gta5' }

author 'Trigueiro'
description 'CNH para vRPEX'
version '1.0.0'


client_script {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    'client.lua'
}
server_script {
    "@vrp/lib/utils.lua",
    'server.lua'
}


