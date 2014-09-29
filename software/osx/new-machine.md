Clean install tips for turning in an old machine
=====

At Sparkbox we try to ensure our developers are using modern hardware, this means that we routinely cycle out machines over two years old for new ones. The following is a collection of tips for cleaning up an old machine before turning it in.

Migration Tips
-------

TL;DR Just migrate using a Time Machine backup

## Manual Migration

* Projects direcotory - this preserves your git repos
* `~/.ssh` keys
* any Xcode keys or certificates
* Sync as many app's preferences via Dropbox

    * For Mac App Store apps you can copy the preference file manually by copying the `~/Library/Preferences/com.some-company` over to the new machine. Once you have copied it over run `defaults read ~/Library/Preferences/com.some-company` to reload the new preferences.

* Note what homebrew packages you have installed on your old machine via `brew list`

Before turning in
-------

Once you have all your data on your new machine and you're ready to turn in your old machine, make sure these steps have been done on the old machine.

* Erased the main drive using Disk Utility via Recovery Mode or another bootable drive.
* Created a new user account which should be the only account on the machine.   

    * Ensure you give the username and password to Dom when you turn in the new machine.

* Installed the latest version of OS X and any updates
* Installed a few necessary packages:

    * [homebrew](http://brew.sh)
    * [rvm](http://rvm.io) or [rbevn](https://github.com/sstephenson/rbenv)

* Removed any stickers (for bonus points, not necessary)
