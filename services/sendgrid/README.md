# SendGrid

[![SendGrid Logo][producti]][product]

Our SMTP provider of choice.

## Issues

If emails look like they are being sent to SendGrid, but aren't being delivered and aren't showing in the logs, then they're probably being deferred.

Click on `Email Activity` in the navbar, then under `Search Options` select `Deferred`. If the emails that are being lost show up here with:

```
Reason: 553 4.1.8 : Domain of sender address bounces+24253-e2e9-emailname=some_domain.com@email.seesparkbox.com does not resolve.
```

then there is most likely a DNS issue.

_Solution:_

- Click on the `Developers` link in the navbar.
- Click `Whitelabel Wizard` in the right side nav.
- Walk through the steps and ensure that the DNS records have been added to [dnsimple][dnsimple].

[product]: https://sendgrid.com/
[producti]: https://keen.io/docs/_images/sendgrid_logo.png
[dnsimple]: http://dnsimple.com
