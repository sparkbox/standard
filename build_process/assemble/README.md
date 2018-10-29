# Assemble

![Assemble Logo](https://avatars2.githubusercontent.com/u/2645080?s=140)

The static site generator we use to build templates.

## Docs

  * [Assemble](http://assemble.io/docs/)
  * [Assemble Helpers](http://assemble.io/helpers/)

## Causes for common errors:

* If there is a conflict between values in our `YAML` data files and Handlebars helpers they often throw strange, unhelpful error messages. This can be fixed by scoping references in `hbs` files to the current object, for example: `this.icon` will avoid conflicts with the `icon` helper.

Known helpers that we often conflict with:
    * `icon`
    * `href`
    * `link`
    * `copy`
    * `content`

* Data lists cannot be given the same name as the filename. The grunt task will not throw an error, but the entire partial will mysteriously fail.
