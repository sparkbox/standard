At Sparkbox, there are many ways we make sure security is a priority when working on client projects. We use a number of different tools in helping us to keep information secure.

We know how important it is to protect ourselves against vulnerabilities during development and to keep sensitive information safe. Below is a list of the ways that we make security a priority in our organization:

## Commit signature verification

In Github, we make sure to use [verified commits](https://github.com/sparkbox/standard/blob/master/security/verified-commits.md) so that we can trust changes are coming from the correct person. Not using verified commits means that another party can pretend to be you by using your name and email.

## Git secrets

We have implemented [git secrets](https://github.com/sparkbox/secrets) in our projects to prevent us from committing sensitive information to a repository. This works by scanning the commit messages and comparing it with our list of prohibited keywords that we don't want in our repositories.

## 2FA

Sparkbox requires that all members of the Sparkbox organization in Github set up [two-factor authentication](https://github.com/sparkbox/standard/blob/master/security/two-factor-authentication.md) and use a tool like [Authy](https://authy.com/) or the built-in [two-factor authentication support in 1Password](https://support.1password.com/one-time-passwords/) instead of using an SMS number.

## Soon Expired Bot

[Soon Expired](https://github.com/sparkbox/soonexpired) is a Slack integration we created to monitor domains for expired SSL certificates. SSL certificiates are important for creating a secure connection between the browser and the web server.

## VPN

Sparkbox partners with [DataYard](https://datayard.us) for their VPN so that team members can connect from anywhere and have their connection encrypted. Being connected to the VPN also allows us to connect to other client's internal network resources.

## npm audit

When working on Node based projects, we use [npm audit](https://docs.npmjs.com/cli/audit) to assess security vulnerabilities in package dependencies for our projects.

## OWASP ZAP

We use the free and open source tool, [OWASP Zed Attack Proxy (ZAP)](https://www.zaproxy.org/), to find security vulnerabilities in our applications.