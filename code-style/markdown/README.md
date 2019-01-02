# Markdown

[![The Markdown Mark][producti]][product]

Markdown is a terse markup language that produces HTML.

## Style

* Prefer footnotes to inline [links][links]

  ```markdown
  // bad
  Sweet [link](http://linkzilla.biz) coming.

  // good
  Sweet [link][link] coming.

  [link]: http://linkzilla.biz

  // also good
  Sweet [link][] coming.

  [link]: http://linkzilla.biz
  ```

* Use hash marks for consistent header markup

  ```markdown
  // bad
  This is an inconsistent H1
  =================

  ## Check Out My H2

  ### Inconsistent H3

  // good

  # This is still a big, friendly H1

  ## Check Out My H2

  ### My H3 looks like everything else now
  ```

[product]: http://daringfireball.net/projects/markdown/
[producti]: http://i.imgur.com/TUYGZBI.png
[links]: http://daringfireball.net/projects/markdown/syntax#link
