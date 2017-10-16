Git
===

![Git plus GitHub](http://i.imgur.com/R1imkCJ.png)

We use Git version control for all of our projects at [Sparkbox][]. We host
our code on GitHub. Large features get their own branch and are merged with a
pull request.

_Never forget all this juicy knowledge!  Set your commit message template to 
[this wonderful example](./.gitmessage), by running:_

```git config --global commit.template "path/to/.gitmessage"```

The Art of the Commit Message
-----------------------------

We use a strict style for all of our commit messages. The style we use helps
ensure that our commits stay small and are easy to browse.

**The Layout**

```
<type>: <subject>

<body>

<footer>
```

**The Title (the first line)**

The title consists of the `<type>` and the `<subject>`.

> Protip: Find yourself with an _and_ in that commit title?  Consider breaking
> the commit down.  `git commit -p` is your friend!

**Allowed Values for `<type>`**

- **feat** (new feature)
- **fix** (bug fix)
- **docs** (changes to documentation)
- **style** (formatting, missing semi colons, etc; no code change)
- **refactor** (refactoring production code)
- **test** (adding missing tests, refactoring tests; no production code change)
- **chore** (updating grunt tasks etc; no production code change)

**Subject**

An [imperative tone][365] is also helpful in conveying what a commit does,
rather than what it did. For example, use **change**, not _changed_ or
_changes_.


**Funtip**

Work hard, play hard!  Consider prefixing your commit messages with a relevant emoji for 
great good.
* :art: `:art:` when improving the format/structure of the code
* :racehorse: `:racehorse:` when improving performance
* :non-potable_water: `:non-potable_water:` when plugging memory leaks
* :memo: `:memo:` when writing docs
* :penguin: `:penguin:` when fixing something on Linux
* :apple: `:apple:` when fixing something on Mac OS
* :checkered_flag: `:checkered_flag:` when fixing something on Windows
* :bug: `:bug:` when fixing a bug
* :fire: `:fire:` when removing code or files
* :green_heart: `:green_heart:` when fixing the CI build
* :white_check_mark: `:white_check_mark:` when adding tests
* :lock: `:lock:` when dealing with security
* :arrow_up: `:arrow_up:` when upgrading dependencies
* :arrow_down: `:arrow_down:` when downgrading dependencies
* :shirt: `:shirt:` when removing linter warnings

Example:
```
:fire: feat (buybox): removed unused container elements
```

**The Body**

The body of the commit message should use a style similar to the one proposed
in this [article by tpope][tpope]. The body, just like the subject, should use
an imperative tone.


_Inspired by [Angular][angularc] and [Karma's][karmac] commit style._

**The Footer**

Here you can reference issues and pull-requests that relate to your commit, like so:

```
closes #125
```

You can see the [official Github doc](https://help.github.com/articles/closing-issues-via-commit-messages/) for all the keywords to close issues and pull-requests.

Example Commit Messages
-----------------------

```
feat: onUrlChange event (popstate/hashchange/polling)

Added new event to $browser:
- forward popstate event if available
- forward hashchange event if popstate not available
- do polling when neither popstate nor hashchange available

Breaks $browser.onHashChange, which was removed (use onUrlChange instead)
```

```
fix: couple of unit tests for IE9

Older IEs serialize html uppercased, but IE9 does not...
Would be better to expect case insensitive, unfortunately jasmine does
not allow to user regexps for throw expectations.

Closes #392
Breaks foo.bar api, foo.baz should be used instead
```

```
feat: ng:disabled, ng:checked, ng:multiple, ng:readonly, ng:selected

New directives for proper binding these attributes in older browsers (IE).
Added coresponding description, live examples and e2e tests.

Closes #351
```

```
style: add couple of missing semi colons

docs: updated fixed docs from Google Docs

Couple of typos fixed:
- indentation
- batchLogbatchLog -> batchLog
- start periodic checking
- missing brace
```

```
feat: simplify isolate scope bindings

Changed the isolate scope binding options to:
  - @attr - attribute binding (including interpolation)
  - =model - by-directional model binding
  - &expr - expression execution binding

This change simplifies the terminology as well as
number of choices available to the developer. It
also supports local name aliasing from the parent.

BREAKING CHANGE: isolate scope bindings definition has changed and
the inject option for the directive controller injection was removed.

To migrate the code follow the example below:

Before:

scope: {
  myAttr: 'attribute',
  myBind: 'bind',
  myExpression: 'expression',
  myEval: 'evaluate',
  myAccessor: 'accessor'
}

After:

scope: {
  myAttr: '@',
  myBind: '@',
  myExpression: '&',
  // myEval - usually not useful, but in cases where the expression is assignable, you can use '='
  myAccessor: '=' // in directive's template change myAccessor() to myAccessor
}

The removed `inject` wasn't generaly useful for directives so there should be no code using it.
```

[angularc]: https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit#
[karmac]: http://karma-runner.github.io/0.8/dev/git-commit-msg.html
[365]: http://365git.tumblr.com/post/3308646748/writing-git-commit-messages
[tpope]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pull_request]: khttps://help.github.com/articles/using-pull-requests
[Sparkbox]: http://seesparkbox.com
[Sprintly]: https://sprint.ly/
