## SSH

We authenticate with remote servers using [PKI][pki], which means we use
generated keys stored in files on our computers rather than passwords
that must be typed each time we connect. The first step is to generate these
keys using the `ssh-keygen` command:

    $ ssh-keygen -t rsa -b 4096

This will ask you a few questions. The first two deal with how to name the files
and where to store them. Unless you have a really good reason, use the defaults.
If it asks you if you want to overwrite an existing file, stop and get help.
It'll next ask you for a passphrase. Adding one will make your keys harder to
steal, but it's usually okay to leave this blank (it'll also ask you to confirm
the passphrase, which can be blank as well). This will leave you with two files:

  - id_rsa
  - id_rsa.pub

After you have your keys, clone the [public keys repository][public_keys] and
add or replace your key. Give it a short but descriptive name to differentiate
it from the others.

    $ cp ~/.ssh/id_rsa.pub myockey.pub
    $ git add myockey.pub
    $ git commit -m "chore: Adding Yock's public key"
    $ git push

You should only ever put the `id_rsa.pub` key into this repository and never
share `id_rsa`. We use a tool called [Forte][forte] to distribute these keys to
our servers. Work with [Ryan](https://sparkbox.slack.com/messages/@cromwell/) or
[Mike](https://sparkbox.slack.com/messages/@yock/) to get this done.

The shared account username is in the Sparkbox 1Password vault. See the server entry for Sparkbox QA.

[public_keys]: https://github.com/sparkbox/public_keys
[forte]: https://github.com/yock/forte
[pki]: http://www.techrepublic.com/article/a-beginners-guide-to-public-key-infrastructure/
