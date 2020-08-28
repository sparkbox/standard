## SSH

We authenticate with remote servers using [PKI][pki], which means we use generated keys stored in files on our computers rather than passwords that must be typed each time we connect. The first step is to generate these keys using the `ssh-keygen` command:

    $ ssh-keygen -t rsa -b 4096

This will ask you a few questions. The first two deal with how to name the files and where to store them. Unless you have a really good reason, use the defaults as they work well with a majority of use cases. If it asks you if you want to overwrite an existing file, stop and get help. It'll next ask you for a passphrase. Leaving the password blank reduces the security nominally, but increases convenience significantly.  Unless your org has requirements about having passwords on keys, it’s usually ok to leave this blank. (It'll also ask you to confirm the passphrase, which can be blank as well). This will leave you with two files:

  - id_rsa
  - id_rsa.pub

After you have your keys, clone the [public keys repository][public_keys] repository and add or replace your key. Give it a short but descriptive name to differentiate it from the others.

    $ cp ~/.ssh/id_rsa.pub myockey.pub
    $ git add myockey.pub
    $ git commit -m "chore: Adding Yock's public key"
    $ git push

You should only ever put the `id_rsa.pub` key into this repository and never share `id_rsa`. We use a tool called [Forte][forte] to distribute these keys to our servers. Work with [Ryan][ryan] or [Adam][adam] to get this done.

The shared account username is in the Sparkbox 1Password vault. See the server entry for Sparkbox QA.

## Using an SSH config file / Creating Identity Files

By creating a local configuration file for SSH, you can create shortcuts for servers you frequently access and define more advanced options. Additionally, by creating identity files, you can revoke or update a key for a specific server without having to edit the key everywhere else.

If you haven’t done so yet, create a config file:

    $ touch ~/.ssh/config

To add a host, add the required parameters you’d need to SSH into the server, like `User`, `HostName`, and optionally `IdentityFile`.

    Host example_server
         User sparkler
         HostName 23.222.222.2
         IdentityFile ~/.ssh/example/id_rsa

The `IdentityFile` option above is simply another generated private key, just like our `~/.ssh/id_rsa` key. To generate this key in this example, we would have run the following command:

    $ ssh-keygen -f ~/example/id_rsa -t rsa -b 4096

The `-f` flag specifies the file location. For help with other options, visit this resource on [generating a new SSH key][keygen].

After saving, you can open a new SSH session to this server by running this command:

    $ ssh example_server

You can append as many hosts as you need to your config file.

## Debugging SSH

Sometimes we run into issues trying to SSH into a server. Do we have the wrong username? Did we incorrectly store our HostName? Running SSH commands in verbose mode can help us debug our ssh connection.

Verbose mode causes ssh to print debugging messages about its progress. It is run by adding the `-v` flag. Multiple v’s increase the verbosity of the messages (with a maximum of three) e.g. `-v` vs `-vvv`.  Additionally, you can create a log file (instead of a standard error) with the `-E` flag followed by the name of the file you want to save. So an example of a verbose ssh connection with errors logged would be this:

    $ ssh example_server -vvv -E log_file

Run `man ssh` for additional parameters you can run with ssh.

[keygen]:https://www.ssh.com/ssh/keygen/
[adam]:https://sparkbox.slack.com/messages/@adam/
[ryan]:https://sparkbox.slack.com/messages/@cromwell/
[public_keys]: https://github.com/sparkbox/public_keys
[forte]: https://github.com/yock/forte
[pki]: http://www.techrepublic.com/article/a-beginners-guide-to-public-key-infrastructure/