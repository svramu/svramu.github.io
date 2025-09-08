# Chirpy Starter

[![Gem Version](https://img.shields.io/gem/v/jekyll-theme-chirpy)][gem]&nbsp;
[![GitHub license](https://img.shields.io/github/license/cotes2020/chirpy-starter.svg?color=blue)][mit]

When installing the [**Chirpy**][chirpy] theme through [RubyGems.org][gem], Jekyll can only read files in the folders
`_data`, `_layouts`, `_includes`, `_sass` and `assets`, as well as a small part of options of the `_config.yml` file
from the theme's gem. If you have ever installed this theme gem, you can use the command
`bundle info --path jekyll-theme-chirpy` to locate these files.

The Jekyll team claims that this is to leave the ball in the user’s court, but this also results in users not being
able to enjoy the out-of-the-box experience when using feature-rich themes.

To fully use all the features of **Chirpy**, you need to copy the other critical files from the theme's gem to your
Jekyll site. The following is a list of targets:

```shell
.
├── _config.yml
├── _plugins
├── _tabs
└── index.html
```

To save you time, and also in case you lose some files while copying, we extract those files/configurations of the
latest version of the **Chirpy** theme and the [CD][CD] workflow to here, so that you can start writing in minutes.

## Usage

Check out the [theme's docs](https://github.com/cotes2020/jekyll-theme-chirpy/wiki).

Testing your GitHub Pages site locally with Jekyll - GitHub Docs
https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll

```bash
svr@tnr: ...3: tattvum/svram---ub.io$ bundle exec jekyll serve # inside this repo's root folder where the Gemfile is.
# Configuration file: /home/svr/tattvum/svramu.github.io/_config.yml
#             Source: /home/svr/tattvum/svramu.github.io
#        Destination: /home/svr/tattvum/svramu.github.io/_site
#  Incremental build: disabled. Enable with --incremental
#       Generating...
#                     done in 0.798 seconds.
#  Auto-regeneration: enabled for '/home/svr/tattvum/svramu.github.io'
#     Server address: http://127.0.0.1:4000/
#   Server running... press ctrl-c to stop.
```

## Contributing

This repository is automatically updated with new releases from the theme repository. If you encounter any issues or want to contribute to its improvement, please visit the [theme repository][chirpy] to provide feedback.

## License

This work is published under [MIT][mit] License.

[gem]: https://rubygems.org/gems/jekyll-theme-chirpy
[chirpy]: https://github.com/cotes2020/jekyll-theme-chirpy/
[CD]: https://en.wikipedia.org/wiki/Continuous_deployment
[mit]: https://github.com/cotes2020/chirpy-starter/blob/master/LICENSE

## Notes

svramu.github.io/_posts/2025-09-06-management-do-unto-others.md
(Management: Do unto others...)
(Nice tile, but no article... not even in orig...)
https://www.tattvum.com/the-nexus-between-application-design-and-management
