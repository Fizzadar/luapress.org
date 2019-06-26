$title=Luapress

Markdown goes in, HTML comes out. Luapress is a simple and fast static site/blog generator.

Install with <a href="https://luarocks.org">Luarocks</a>:

    $ luarocks install luapress

Create a new site in the current directory:

    $ luapress init http://mywebsite.com

Drop Markdown files in `posts/` & `pages/` and build with:

    $ luapress


## Markdown Extras

Luapress handles a few extensions to normal markdown:

$raw$

+ Use `--MORE--` to generate a excerpt/read-more link in posts
+ Use `[=pages|posts/NAME]` to generate crosslinks between posts/pages
+ Use `$=url` to inject the root URL
+ Use `$=toc` to inject a table of contents for the page
+ Set `$key=value` to set data for that post/page:
    + Set `$time=time_in_epoch_seconds` to set post time
    + Or `$date=day/month/year` (overrides above)
    + `$order=number` sets the order pages appear in the menu
    + `$hidden=true` hides pages from the menu

$/raw$


## Config Options

Modify the auto-generated `config.lua` to customise the Luapress output:

+ `title` to change the site title
+ `template` to use a custom template
+ `posts_dir` and `pages_dir` change the output dirs
+ `index_page` to use a page as index
+ `sticky_page` to stick a pages contents on top of the first index
+ `link_dirs = false` build post/pages at `/name.html` rather than `/name/index.html`
+ `get_post_permalink` & `get_page_permalink` to customize permalinks

All the available options and defaults can be viewed in [the default config](https://github.com/Fizzadar/Luapress/blob/develop/luapress/default_config.lua).


## Environments

Multiple environments can be defined in the config file:

    config = {
        url = 'http://localhost/mysite',
        envs = {
            production = {
                url = 'http://mysite.com',
                build_dir = 'production'
            }
        }
    }

To build against envs:

    # Builds default (localhost/mysite) to ./build (the default)
    $ luapress

    # Builds production (mysite.com) to ./production
    $ luapress production


## Templates

Luapress templates can be written [mustache](https://mustache.github.io/), [etlua](https://github.com/leafo/etlua) or LHTML. You only need to worry about a few files:

+ `header.[mustache|etlua|lhtml]`
+ `footer.[mustache|etlua|lhtml]`
+ One or both of `post.[mustache|etlua|lhtml]` & `page.[mustache|etlua|lhtml]`
+ Optionally an `archive.[mustache|etlua|lhtml]`

The [included templates](https://github.com/Fizzadar/Luapress/tree/develop/template) and [this website](https://github.com/Fizzadar/luapress.org/tree/develop/templates/luapress) serve as good references for building templates.


## Plugins

Plugins can be used like so:

$raw$

    $! MY_PLUGIN arg, arg, arg !$

$/raw$

To use plugins not included with Luapress, just drop them in `plugins/` alongside your `posts/` and `pages/`. Plugins must contain an `init.lua` file which returns a single function. Check out the [gallery plugin](https://github.com/Fizzadar/Luapress/tree/develop/plugins/gallery) as a good reference for building plugins.
