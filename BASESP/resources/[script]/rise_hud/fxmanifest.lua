fx_version "adamant"
game "gta5"

-- UI
ui_page "ui/ui.html"
files {
	"ui/*.html",
	"ui/assets/*.svg",
	"ui/assets/*.png",
	"ui/fonts/fonts/*.ttf",
	"ui/*.js",
	"ui/*.css",
	"ui/assets/logo.gif"
}

-- Client Scripts
client_scripts {
	"@vrp/lib/utils.lua",
	'locales/languages.lua',
	"client.lua",
}
