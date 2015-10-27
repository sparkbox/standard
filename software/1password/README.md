[1Password][1password]
=====

[![1password][1password_image]][1password]
Password manager with simple sync via [Dropbox][sparkbox_dropbox], mobile support and password auditing.

## Setup the Sparkvault
Before beginning, we recommend you have created or added your own vault. This might be your personal vault or, if you share your personal vault with family, a Sparkbox specific personal vault.  You can create vaults via `1Password` > `New Vault` menu item.

1. Get invited to the Sparkvault Dropbox folder by anyone on the Sparkbox team.
2. Double click `Sparkvault.opvault` to begin adding the vault to your 1Password.  (You should be brought into 1Password and presented the _Create New Vault_ dialog with _Sparkvault_ prefilled.)
3. Enter the vault password (You really thought we'd include it in the readme?)

> With great power comes great responsibility
> ~ Uncle Ben

How we use it
-------

Authenticated assets for Sparkbox and many of our clients are maintained in the Sparkvault.  Be mindful of this and use appropriately.

#### Naming Conventions
When naming a new asset, follow the convention `client-asset-environment`.  Some examples:

* `sparkbox-seesparkbox.com-production`
* `fav_customer-mandrill-production`

#### Smart Folders
Each client should have a Smart Folder.  Criteria for this should be `Title begins with <client name>`.

#### Passwords
* Generate passwords when possible


[1password]: https://agilebits.com/onepassword
[1password_image]: ./1password-logo.jpg
[sparkbox_dropbox]: ../../services/dropbox
