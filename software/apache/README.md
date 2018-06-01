
# Apache at Sparkbox

Many of our projects, especially [CMS projects](./cms) projects, are based on PHP or require a traditional server. We tend to prefer Apache in those cases, because it's prevalent and widely used.

This guide walks you through setting up Apache natively on your MacOS with the ability to support multiple versions of PHP. It is based on the fantastic instructions provided by [MacOS Sierra Apache Multiple PHP Versions](https://getgrav.org/blog/macos-sierra-apache-multiple-php-versions) and [Apache httpd 2.4 and PHP 7 in macOS](https://htr3n.github.io/2017/09/apache-httpd-php-macos/)

  * [Installing Xcode Libraries](#installing-xcode-libraries)
  * [Installing Apache](#installing-apache)
  * [Setting up Apache](#setting-up-apache)
  * [Installing PHP](#installing-php)
  * [Setting up a new PHP site in Apache](#setting-up-a-new-php-site-in-apache)
  * [Installing Composer](#installing-composer)
  * [Common Issues](#common-issues)

## Prerequisites

  * MacOS Sierra 10.12.6 or greater
  * Successfully run the [Sparkbox laptop](https://github.com/sparkbox/laptop) script to install HomeBrew and MySQL.
  * Reader must be comfortable issuing commands in the terminal

## Installing Xcode Libraries

    xcode-select --install

## Installing Apache

Disable MacOS Apache

    which apachectl
    sudo apachectl stop
    sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

Install latest Apache from homebrew

    brew install httpd

Configure Apache to auto start using Homebrew services

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

    LoadModule rewrite_module libexec/mod_rewrite.so
    LoadModule proxy_module lib/httpd/modules/mod_proxy.so
    LoadModule proxy_fcgi_module lib/httpd/modules/mod_proxy_fcgi.so

:memo: Note: `mod_proxy` will support using PHP-FPM for executing multiple
concurrently installed versions of PHP.

### vHost file support
Each vhost (site) will be configured in it's own file in the
`/usr/local/etc/httpd/vhosts` directory. Allow this to happen by:

  1. Add the the following line to the end of your `httpd.conf`

    Include /usr/local/etc/httpd/vhosts/*.conf

  2. `mkdir -p /usr/local/etc/httpd/vhosts`

### Finishing up

  1. Make sure httpd is configured to start on reboot: `brew services restart httpd`
  1. Restart Apache with the changes made: `sudo apachectl -k restart`

## Installing PHP

The following script will install each version of PHP, with FPM, configure
their listening ports for 90## (9071, for example), and configure
FPM to start using brew services. Each version of PHP starts it's own FPM
service with a matching port number: 9056 for PHP 5.6, 9070 for PHP 7.0, etc.

    php_versions=("5.6" "7.0" "7.1" "7.2")

    for version in ${php_versions[*]}; do
      formula="php@$version"

      # Install php version
      brew install "$formula"

      # Configure each PHP-FPM (FastCGI Process Manager) listening port
      www_conf_path="/usr/local/etc/php/$version/php-fpm.d/www.conf"
      fpm_conf_path="/usr/local/etc/php/$version/php-fpm.conf"
      conf_path="unknown file"
      port_suffix=${version/\./}

      if grep -q "listen = 127.0.0.1:90\d\d" "$www_conf_path" 2>/dev/null; then
        conf_path="$www_conf_path"
      elif grep -q "listen = 127.0.0.1:90\d\d" "$fpm_conf_path"; then
        conf_path="$fpm_conf_path"
      fi

      if [ -f "$conf_path" ]; then
        echo "Updating listen port to $port_suffix in $conf_path"
        sed -i.bak "s/listen = 127\.0\.0\.1\:90[[:digit:]][[:digit:]]/listen = 127.0.0.1:90$port_suffix/g" "$conf_path"
      else
        echo "Unable to locate fpm conf file for $version $conf_path"
      fi

      # Configure PHP-FPM to auto start using Homebrew services
      brew services start "$formula"
    done

Important file locations:

    /usr/local/etc/php/5.6/php.ini
    /usr/local/etc/php/7.0/php.ini

## Setting up a new PHP site in Apache

### Create the vHost file
Each site will have it's own _vhost_ file in `/usr/local/etc/httpd/vhosts`.

:warning: You’ll need to swap out the following placeholders with your own settings:

  * `<project_name>`: Domain safe name such as `seesparkbox`
  * `<php_port>`: Port to the PHP-FPM instance, such as `9071` for 7.1
  * `<project_root>`: Web root such as `/projects/seesparkbox/static/dist`

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
        DirectoryIndex index.php index.html

        <Directory "<project_root>">
          AllowOverride All
          DirectoryIndex index.php index.html
          Options Indexes MultiViews FollowSymLinks
          Require all granted
       </Directory>
    </VirtualHost>

Save this file, and restart apache.

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
