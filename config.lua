-- For available configuation options, see: fizzadar.com/luapress
-- Or see the default config at:
-- github.com/Fizzadar/Luapress/blob/develop/luapress/default_config.lua

local config = {
    url = '/',
    template = 'luapress',
    index_page = 'home',

    envs = {
        production = {
            build_dir = 'production',
        },
    },
}

return config
