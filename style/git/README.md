Git
===

![Git plus GitHub](http://i.imgur.com/R1imkCJ.png)

We use Git version control for all of our projects at [Sparkbox][]. We host
our code on GitHub. Large features get their own branch and are merged with a
pull request.

The Art of the Commit Message
-----------------------------

We use a strict style for all of our commit messages. The style we use helps
ensure that our commits stay small and are easy to browse.

**The Layout**

```
<type>(<scope>): <subject>

<body>

<footer>
```

**The Title (the first line)**

The title consists of the `<type>`, the `(<scope>)`, and the `<subject>`.

**Allowed Values for `<type>`**

- **feat** (new feature)
- **fix** (bug fix)
- **docs** (changes to documentation)
- **style** (formatting, missing semi colons, etc; no code change)
- **refactor** (refactoring production code)
- **test** (adding missing tests, refactoring tests; no production code change)
- **chore** (updating grunt tasks etc; no production code change)

**Example `<scope>` Values**

Scope varies per project. For example, a project with an admin interface would
use a scope of `(admin)` to denote commits that change admin code. Another
project might have a scope of `(backup)` to commits referencing backup code
changes.

**Subject**

An [impertivite tone][365] is also helpful in conveying what a commit does,
rather than what it did. For example, use **change**, not _changed_ or
_changes_.

**The Body**

The body of the commit message should use a style similar to the one proposed
in this [article by tpope][tpope]. The body, just like the subject, should use
an impertivite tone.


_Inspired by [Angular][angularc] and [Karma's][karmac] commit style._

**The Footer**

Here's where we references items in our product management tool. [Sprintly][]
allows for many different styles of references. Here are some examples:

*   `References #1, #4, and #2.`
*   `Fix #1.` _note this marks the item as accepted in Sprintly_
*   `Closes #1 and #2.` _note this marks the item as accepted in Sprintly_

Example Commit Messages
-----------------------

```
feat($browser): onUrlChange event (popstate/hashchange/polling)

Added new event to $browser:
- forward popstate event if available
- forward hashchange event if popstate not available
- do polling when neither popstate nor hashchange available

Breaks $browser.onHashChange, which was removed (use onUrlChange instead)

fix($compile): couple of unit tests for IE9

Older IEs serialize html uppercased, but IE9 does not...
Would be better to expect case insensitive, unfortunately jasmine does
not allow to user regexps for throw expectations.

Closes #392
Breaks foo.bar api, foo.baz should be used instead

feat(directive): ng:disabled, ng:checked, ng:multiple, ng:readonly, ng:selected

New directives for proper binding these attributes in older browsers (IE).
Added coresponding description, live examples and e2e tests.

Closes #351

style($location): add couple of missing semi colons

docs(guide): updated fixed docs from Google Docs

Couple of typos fixed:
- indentation
- batchLogbatchLog -> batchLog
- start periodic checking
- missing brace

feat($compile): simplify isolate scope bindings

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
