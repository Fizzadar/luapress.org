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
+ Set `$key=value` to set data for that post/page:
    + Set `$time=time_in_epoch_seconds` to set post time
    + Or `$date=day/month/year` (overrides above)
    + `$order=number` sets the order pages appear in the menu
    + `$hidden=true` hides pages from the menu

$/raw$


## Config Options

Modify the auto-generated `config.lua` to customise the Luapress output:

+ Set `link_dirs = false` to have posts & pages generated at `/name.html` rather than `/name/index.html`
+ Set `config.posts_dir` and `config.pages_dir` to change the output directories for posts & pages
+ The `inc/` directory will be copied to `build/inc/`, and your template inc to `build/inc/template`
+ Add `--nocache` before the URL to ignore caching (for template dev)


## Templates

Luapress templates are written in `lhtml`, a simple extension of HTML, and you only need to worry about a few files:

+ `header.lhtml`
+ `footer.lhtml`
+ One or both of `post.lhtml` & `page.lhtml`
+ Optionally an `archive.lhtml`

Writing out variables in the templates is simple:

    <h1><?=self:get('page').title ?></h1>

Check out the [included template]() and [this website]() serve as good references for building templates.


## Plugins

Plugins can be used like so:

$raw$

    $! MY_PLGUIN arg, arg, arg !$

$/raw$
