fx_version 'bodacious'
game 'gta5'

author 'Phantom1092'
version '1.0.0'

client_scripts {
    'locales/*.lua',
    'client.lua'
}
server_scripts {
    'locales/*.lua',
    'server.lua',
    'config.lua'
}
shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'config.lua',
}

dependencies {
    'es_extended',
    'ox_inventory'
}

