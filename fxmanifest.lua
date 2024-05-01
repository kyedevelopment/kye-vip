fx_version 'adamant'
game 'gta5'
lua54 'yes'
author 'Kye'

client_scripts {
    'client.lua',
    'local.lua',
}
server_script 'server.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

escrow_ignore 'config.lua'
