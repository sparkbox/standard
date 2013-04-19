Style Guide
==============

How to write code.


General
-------

* Delete trailing whitespace.
* Use 2 space indentation (tabs are evil).
* Please do not put spaces in file or directory names.
* Don't make things more complicated then they need to be right now.
* Prefer unit tests to in-line code comments

Git
-------
* Write good commit messages.
* Keep commits small.
* Avoid including files in source control that are specific to your development machine or process.

**Format of the commit message**

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Message subject (first line)**

First line cannot be longer than 70 characters, second line is always blank and
other lines should be wrapped at 80 characters.

**Allowed <type> values**

- **feat** (new feature)
- **fix** (bug fix)
- **docs** (changes to documentation)
- **style** (formatting, missing semi colons, etc; no code change)
- **refactor** (refactoring production code)
- **test** (adding missing tests, refactoring tests; no production code change)
- **chore** (updating grunt tasks etc; no production code change)

**Example &lt;scope&gt; values**

- client
- server
- database

_based on Karma Runner's [style guide][cstyle]._


HTML
-------




Ruby
-------




EE
-------




SCSS
-------
* Prefer the scss syntax over sass syntax
* Run [CSS Comb](http://csscomb.com) before checking in files (plugins are available for many editors)


JS
-------
* Use [JSHint](http://jshint.com) to avoid common problems and bad practices (plugins are available for many editors)


Testing
-------
* Prefer Rspec when unit testing ruby
* Prefer Cucumber for integration testing with rails
* Prefer Jasmine for testing javascript

[cstyle]: http://karma-runner.github.io/0.8/dev/git-commit-msg.html
