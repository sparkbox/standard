### Managing Node Versions With `brew`
This is not our recommended path to manage node versions. For that, see the main [node](./node.md) document.

If you prefer to use brew for node versions, this is how.

`brew search` will show you the versions available on your machine.
```bash
❯ brew search node
==> Searching local taps...
node ✔            leafnode          llnode            node@4            nodeenv
node@6 ✔          libbitcoin-node   node-build        nodebrew          nodenv
```

To switch to a different version, you must first `unlink` the current version and then `link` the target version. Note that some brew packages are "keg-only," and you may need to run `link --force`:
```bash
❯ node -v
v8.9.2

❯ brew unlink node
Unlinking /usr/local/Cellar/node/8.9.2... 7 symlinks removed

❯ brew link node@6
Warning: node@6 is keg-only and must be linked with --force
Note that doing so can interfere with building software.

❯ brew link node@6 --force
Linking /usr/local/Cellar/node@6/6.10.3... 7 symlinks created

❯ node -v
v6.10.3
```
