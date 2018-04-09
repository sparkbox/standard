
# Apache at Sparkbox

Many of our projects, especially [CMS projects](./cms) projects, are based on PHP or require a traditional server. We tend to prefer Apache in those cases, because it's prevalent and widely used.

This guide walks you through setting up Apache natively on your MacOS with the ability to support multiple versions of PHP. It is based on the fantastic instructions provided by [MacOS Sierra Apache Multiple PHP Versions](https://getgrav.org/blog/macos-sierra-apache-multiple-php-versions)

  * [Installing Xcode Libraries](#installing-xcode-libraries)
  * [Installing Homebrew Taps](#installing-homebrew-taps)
  * [Installing Apache](#installing-apache)
  * [Installing PHP](#installing-php)
  * [Setting up Apache](#setting-up-apache)
  * [Turning on PHP in Apache.](#turning-on-php-in-apache)
  * [Vhosts and the Hosts File](#vhosts-and-the-hosts-file)
  * [Install Sequel Pro](#install-sequel-pro)
  * [Installing Composer](#installing-composer)
  * [Common Issues](#common-issues)

## Prerequisites

  * MacOS Sierra 10.12.6 or greater
  * Successfully run the [Sparkbox laptop](https://github.com/sparkbox/laptop) script to install HomeBrew and MySQL.
  * Reader must be comfortable issuing commands in the terminal

## Installing Xcode Libraries

    $ xcode-select --install

## Confirm Homebrew

    $ brew --version
    $ brew doctor

    Resolve any issues with Homebrew

## Installing Apache

    $ which apachectl
    $ sudo apachectl stop
    $ sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null
    $ brew install httpd24 --with-privileged-ports --with-http2

  :warning:Note: 2.4.27 might not be what you installed, check your version and replace it in the following command: 

    $ sudo cp -v /usr/local/Cellar/httpd24/2.4.27/homebrew.mxcl.httpd24.plist /Library/LaunchDaemons
    $ sudo chown -v root:wheel /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
    $ sudo chmod -v 644 /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
    $ sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist

    $ sudo apachectl -k restart

  Useful commands to know:

    $ sudo apachectl start
    $ sudo apachectl stop
    $ sudo apachectl -k restart

  Important file locations:

    /usr/local/etc/httpd/httpd.conf

## Installing PHP

    $ brew install php56 --with-httpd24
    $ brew unlink php56
    $ brew install php70 --with-httpd24

You also need to install mcrypt. 

    $ brew install php70-mcrypt --with-httpd24

Important file locations:

    /usr/local/etc/php/5.6/php.ini
    /usr/local/etc/php/7.0/php.ini

## Setting up Apache

Choose a "web root". For example, a good place to put web files would be in your home directory under `www`: 

    ~/www/

Create a default VHost

In your web root:

    $ echo "Hello there" > index.html
    $ echo "<?php phpinfo();" > info.php

Edit your Apache Configuration File, DocumentRoot to the following. (Replace the existing document root with your document root):

    DocumentRoot "/Users/<your_username>/www"

    <Directory "/Users/<your_username>/www">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
    </Directory>

Add

    Include /usr/local/etc/httpd/vhosts/*.conf

User/Group

    User _www
    Group _www

### Mod Rewrite

Uncomment the line:

    LoadModule rewrite_module libexec/mod_rewrite.so


### Turning on PHP in Apache.

Open the Apache Config file (`/usr/local/etc/httpd/httpd.conf`)

**Edit the following lines:**

    LoadModule php5_module        /usr/local/Cellar/php56/5.6.26_3/libexec/apache2/libphp5.so
    LoadModule php7_module        /usr/local/Cellar/php70/7.0.11_5/libexec/apache2/libphp7.so

**To the following:**

    # LoadModule php5_module    /usr/local/opt/php56/libexec/apache2/libphp5.so
    LoadModule php7_module    /usr/local/opt/php70/libexec/apache2/libphp7.so

**Edit the following lines:**

    <IfModule dir_module>
      DirectoryIndex index.html
    </IfModule>

**To the following:**

    <IfModule dir_module>
      DirectoryIndex index.php index.html
    </IfModule>

    <FilesMatch \.php$>
      SetHandler application/x-httpd-php
    </FilesMatch>

### Vhosts and the Hosts File

Using Apache 2.4  you should be able to add vhosts using the vhost directory.

In your local apache `/usr/local/etc/httpd/` directory run the following commands.

    $ mkdir vhosts
    $ cd vhosts
    $ touch <your_project_name>.conf

Open the file `<your_project_name>.conf`

Copy and paste the following vhost configuration inside that file:

    <VirtualHost 127.0.0.1:80>
      ServerAdmin youremail@heysparkbox.com
      DocumentRoot "<your_path_to_files>/<your_project_name>/web"
      ServerName <your_project_name>.local

      <Directory "<your_path_to_files>/<your_project_name>/web">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride All
        Require all granted
        DirectoryIndex index.php
      </Directory>
    </VirtualHost>

You’ll need to swap out the bolded text with your own settings.

Save this file, and restart apache.

Host file, open with `sudo` to make changes to /etc/hosts
Add the following to the end of the file.

    127.0.0.1 <your_project_name>.local

## Installing Composer

We’ll be installing composer globally. 

    $ cd ~
    $ wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --quiet
    $ mv composer.phar /usr/local/bin/composer

## Common Issues

### PHP Segfaults

In PHP versions similar to 7.0.27, and httpd versions similar to 2.4.29, you might run into errors like this within your log file:

    [Thu Feb 15 09:16:51.849759 2018] [core:notice] [pid 3230:tid 140735914537792] AH00052: child pid 3254 exit signal Segmentation fault (11)

To fix this, you must enable the `mpm_prefork_module` by adding this line to your `httpd.conf` file:

    LoadModule mpm_prefork_module lib/httpd/modules/mod_mpm_prefork.so

:warning: **Note:** You may also need to comment out the `mpm_event_module` in order to get this to load.
