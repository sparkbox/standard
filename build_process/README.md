# Build, Deployment, and Delivery

We believe that the more frequently we deploy, the better we collaborate as
team and with our clients to navigate our way towards the most appropriate
outcome.

Our expectation is that anyone of our development team should be able to build 
and deploy within a few moments of cloning a project repository.

## In This Guide
* [What is a "build process"?](#what-is-a-build-process)
* ["Building" projects in your local environment](#building-projects-in-your-local-environment)
* [Common build tasks](#common-build-tasks)

### What is a "Build Process"?
When we use the phrase "build process", we are describing an activity that translates source files into production-ready files. Typically, source code and files are written and created by humans, and the build artifacts — the "executable" code and other assets resulting from a build — are written or compiled via an automated process.

You may hear or see the term "task" or "build task". You can think of a build task as an individual piece of a larger build process. A build task can also serve as a single process that can be executed on its own, outside of the larger build process.

### Building Projects In Your Local Environment
Our build process is Node-based, meaning that we rely on [Node](https://nodejs.org/en/) to translate our source files into production-ready files. Specifically, our build processes use [npm scripts](https://github.com/sparkbox/standard/blob/master/build_process/node.md#npm-scripts) to handle the translation of source files into build artifacts.

Note that in the past, we have used other Node-based build methods, including [Grunt](https://gruntjs.com/) and [Gulp](https://gulpjs.com/).

Ultimately, regardless of the tools we choose, our goal is to have a build process that fits the projects' needs and our clients' needs, and we strive to strike a balance between having a great developer experience and a great resulting project.

### Common Build Tasks
Build tasks are used to compile or transpile our source code into production-ready code.

Some of our common build tasks include:
* Compiling Sass to CSS
* Using PostCSS with Autoprefixer
* Transpiling JavaScript



## Quality Expectations

There are certain things we expect to happen frequently to help keep quality
visible to our team and clients.

  - Performance Budgets: Performance budgets should be captured early and
    performance tracked automatically. Trends are as important as limits.
  - Style: We seek consistency in code structure and style within a project. 
    We expect that how we structure Sass, Javascript, Ruby, Html, etc will
    change over time as we learn. Those choices we make on a project should be
    codified with tools like [jshint], [stylelint], [Code Climate], etc.
  - Tests: Every project should be configured to support automated tests. In
    most cases, this means [Jasmine], Mocha, Rspec, Minitest, etc. These tests
    should be easy to run locally, preferrably when code changes. All tests
    should run using [CircleCI], reporting results to Pull Requests.

[jshint]: https://github.com/jshint/jshint
[stylelint]: https://github.com/stylelint/stylelint
[Code Climate]: https://codeclimate.com
[CircleCI]: https://circleci.com/
[Jasmine]: https://jasmine.github.io/
[Mocha]: https://mochajs.org/ 
[Rspec]: http://rspec.info/
[Minitest]: https://github.com/seattlerb/minitest
