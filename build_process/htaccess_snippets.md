# Whitelisting the Sparkbox Network on QA Sites

Depending on your version of Apache, add one of the two snippets shown below to your `.htaccess` file wherever you are serving your QA site in order to allow all users on the Sparkbox network (in the office or signed into the VPN) to load your site without needing to use login credentials. Logging in will still be required for anyone not on the Sparkbox network.

## Apache Version 2.2

```
AuthUserFile /path/to/.htpasswd
AuthName "Restricted"
AuthType Basic
require valid-user
Order allow,deny
Allow from 64.56.115.10
satisfy any
```

## Apache Version 2.4

```
AuthType Basic
AuthName "Restricted access"
AuthUserFile "/path/to/.htpasswd"
SetEnvIF X-Forwarded-For "64.56.115.10" AllowIP
<RequireAny>
        Require env AllowIP
        Require valid-user
</RequireAny>
```