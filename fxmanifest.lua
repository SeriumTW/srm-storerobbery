fx_version 'cerulean'
game 'gta5'
author 'SeriumTW'
description 'Market Robbery Script'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
	'config.lua'
}

client_scripts {
    'client/main.lua',
}

files {
    'html/*',
}

server_scripts {
    'server/main.lua',
}

lua54 'yes'

dependencies {
    'es_extended',
    -- Add any additional ESX dependencies here.
}
