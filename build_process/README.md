# Build, Deployment, and Delivery

We believe that the more frequently we deploy, the better we collaborate as
team and with our clients to navigate our way towards the most appropriate
outcome.

Our expectation is that anyone of our development team should be able to build 
and deploy within a few moments of cloning a project repository.

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
