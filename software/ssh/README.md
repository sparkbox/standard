## SSH

Generate your public/private keys

    $ ssh-keygen -t dsa

Push your public `.pub` key to [sparkbox/public_keys][public_keys]

Ask someone to update authorized_keys on our servers using [forte][forte]

[public_keys]: https://github.com/sparkbox/public_keys
[forte]: https://github.com/yock/forte
