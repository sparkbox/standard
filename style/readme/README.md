Readme
======

The `README.md` file in our project's root folder is the central location for
all information about the project. The template below is the starting point for
all new projects at Sparkbox.

Template
--------

A file in the root of your project called `README.md`.

    Project Title
    =============

    One sentence summary of the project.

    | :sparkles: | :star2: |
    | ---------- | ------- |
    **Live Site**    | http://live-site-url.com
    **Staging Site** | http://staging-url.herokuapp.com
    **CI**           | https://circleci.com/gh/sparkbox/repo-name
    **Rollbar**      | https://rollbar.com/project/project-id
    **Coveralls**    | [![Coverage Status](https://coveralls.io/repos/sparkbox/repo-name/badge.png?branch=master)](https://coveralls.io/r/sparkbox/repo-name?branch=master)
    **Code Climate** | https://codeclimate.com/repos/[repo-hash]/feed

    Setup
    -----

    Follow these instructions to get Project Name running on your system.

    1. MySQL _install with [Homebrew][homebrew] with `brew install mysql`_
    1. Ruby 2.0.0-p0 _install with [RVM][rvm] via `rvm install 2.0.0-p0`_
    1. `bundle` _installs the required Ruby gems_
    1. `cp config/application.yml.example config/application.yml`
    1. Uncomment and fill in all of the environment variables in
    `config/application.yml` to match your setup.
    1. `rake db:create` _create the database_
    1. `rake db:migrate` _migrate it to the latest schema_

    Technologies Used
    -----------------

    * Rails
    * MySQL
    * ...
