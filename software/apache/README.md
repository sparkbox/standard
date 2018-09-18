
# Apache at Sparkbox

Many of our projects, especially [CMS projects](../cms) projects, are based on PHP or require a traditional server. We tend to prefer Apache in those cases, because it's prevalent and widely used.

This guide walks you through setting up Apache natively on your MacOS with the ability to support multiple versions of PHP using PHP-FPM (FastCGI Process Manager). It is based on the fantastic instructions provided by [MacOS Sierra Apache Multiple PHP Versions](https://getgrav.org/blog/macos-sierra-apache-multiple-php-versions) and [Apache httpd 2.4 and PHP 7 in macOS](https://htr3n.github.io/2017/09/apache-httpd-php-macos/)

After running this setup guide, you will have 2 types of services running:

1. `httpd` Apache accepting incoming http(s) requests and matching them up with configured VirtualHost entries.
1. `php-fpm` PHP FastCGI Process Manager receiving requests from Apache to process a PHP file.

PHP runs as a service to allow us to have multiple versions of PHP active for Apache at any time. Without FPM, Apache must be configured for a specific version of PHP. Switching for a project requires reconfiguring and restarting Apache.

## Steps

  * [Prerequisites](#prerequisites)
  * [Installing Xcode Libraries](#installing-xcode-libraries)
  * [Installing Apache](#installing-apache)
  * [Setting up Apache](#setting-up-apache)
  * [Installing PHP](#installing-php)
  * [Setting up a new PHP site in Apache](#setting-up-a-new-php-site-in-apache)
  * [Installing Composer](#installing-composer)
  * [Common Issues](#common-issues)

## Prerequisites

  * MacOS Sierra 10.12.6 or greater
  * Successfully run the [Sparkbox laptop](https://github.com/sparkbox/laptop) script to install Homebrew, PHP-FPM, and MySQL.
  * Reader must be comfortable issuing commands in the terminal

## Installing Xcode Libraries

    xcode-select --install

## Installing Apache

Disable MacOS Apache

    which apachectl
    sudo apachectl stop
    sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

Configure Apache (httpd), which was already installed via the [laptop script](https://github.com/sparkbox/laptop), to auto start using Homebrew services. 

    brew services start httpd

  Useful commands to know:

    sudo apachectl start
    sudo apachectl stop
    sudo apachectl -k restart

  Important file locations:

    /usr/local/etc/httpd/httpd.conf

## Setting up Apache

Edit your Apache Configuration File (`/usr/local/etc/httpd/httpd.conf`)
to enable:

### Listen on port 80
Change the `Listen` setting from `8080` to `80`. 

    Listen 80

### Enable Apache Modules
Uncomment out the following lines (they will not be together):

    LoadModule xml2enc_module lib/httpd/modules/mod_xml2enc.so
    LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so
    LoadModule proxy_module lib/httpd/modules/mod_proxy.so
    LoadModule proxy_fcgi_module lib/httpd/modules/mod_proxy_fcgi.so

:memo: Note: `mod_proxy` will support using PHP-FPM for executing multiple
concurrently installed versions of PHP.

### vhost file support
Each vhost (site) will be configured in its own file in the
`/usr/local/etc/httpd/vhosts` directory. Allow this to happen by:

  1. Add the following line to the end of your `httpd.conf`

    Include /usr/local/etc/httpd/vhosts/*.conf

  2. `mkdir -p /usr/local/etc/httpd/vhosts`

## PHP

Multiple versions of PHP were installed and configured to run as [brew services]
by the Sparkbox [laptop script](https://github.com/sparkbox/laptop). You can see each version running with

    brew services list | grep php

Important file locations:

    /usr/local/etc/php/5.6/php.ini
    /usr/local/etc/php/7.0/php.ini

## Setting up a new PHP site in Apache

### Create the vhost file
Each site will have its own _vhost_ file in `/usr/local/etc/httpd/vhosts`.

:warning: You’ll need to swap out the following placeholders with your own settings:

  * `<project_name>`: Domain safe name such as `seesparkbox`
  * `<php_port>`: Port to the PHP-FPM instance, such as `9071` for 7.1
  * `<project_root>`: Web root such as `/projects/seesparkbox.com/ee`

  :warning: You should _not_ place your Apache projects under `~/Documents`. Apache
  requires both write and execute permissions on all paths in the site directory,
  which is not advised. Instead, we recommend `~/projects` as the parent for all
  Apache projects.


Copy, paste, & edit the following vhost configuration inside the
file `/usr/local/etc/httpd/vhosts/<project_name>.conf`:

    <VirtualHost *:80>
        ServerName <project_name>.local
        DocumentRoot "<project_root>"
        ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:<php_port><project_root>/$1
        ErrorLog "/usr/local/var/log/httpd/<project_name>-error_log"
        CustomLog "/usr/local/var/log/httpd/<project_name>-access_log" common
        DirectoryIndex index.html index.php

        <Directory "<project_root>">
          AllowOverride All
          Options Indexes MultiViews FollowSymLinks
          Require all granted
       </Directory>
    </VirtualHost>

Save this file.

### Finishing up

  1. Make sure httpd is configured to start on reboot: `brew services restart httpd`
  1. Restart Apache with the changes made: `sudo apachectl -k restart`

### Add the site to your `hosts` file
With `sudo` open `/etc/hosts` and add the following to the end of the file:

    127.0.0.1 <project_name>.local

## Installing Composer

Installing composer globally.

    brew install composer

## Common Issues

### PHP Segfaults

In PHP versions similar to 7.0.27, and httpd versions similar to 2.4.29, you might run into errors like this within your log file:

    [Thu Feb 15 09:16:51.849759 2018] [core:notice] [pid 3230:tid 140735914537792] AH00052: child pid 3254 exit signal Segmentation fault (11)

To fix this, you must enable the `mpm_prefork_module` by adding this line to your `httpd.conf` file:

    LoadModule mpm_prefork_module lib/httpd/modules/mod_mpm_prefork.so

:warning: **Note:** You may also need to comment out the `mpm_event_module` in order to get this to load.
