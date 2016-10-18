# Github Verified Commits

The identity of a person committing to a Github repository is not tied to their Github account. It is instead part of your local Git configuration which Github reads and attempts to fill in other information from what it knows about its users. For an example of this, see [pull request #64][why-verified-is-important] in the Sparkbox Standard Github repository.

The solution to this is "Verified" commits. Verified commits are changes to a git repository that have been cryptographically signed by the committer. Github's role here is the same, it is merely reading information from the Git repository and filling in information from what it knows about it's users. The difference is that rather than relying on configuration data (such as an email address) they can verify a commit was signed by someone who has previously shared information with them. That information is called a "key", and this guide discusses how to generate that key, how to use it, and how to keep it safe.

[why-verified-is-important]: https://github.com/sparkbox/standard/pull/64
