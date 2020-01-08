At Sparkbox, we prioritize security in many ways when working on client projects. We use a number of different tools that protect us against vulnerabilities during development and keep sensitive information safe.

Below is a list of the ways that we make security a priority in our organization:

## Commit Signature Verification

In Github, we make sure to use [verified commits](https://github.com/sparkbox/standard/blob/master/security/verified-commits.md) so we can trust that changes are coming from the correct person. Not using verified commits means that another party can pretend to be a team member by using their name and email.

## Git Secrets

We have implemented [git secrets](https://github.com/sparkbox/secrets) in our projects to prevent us from committing sensitive information to a repository. This works by scanning the commit messages and comparing it with our list of prohibited keywords that we don't want in our repositories.

## 2-Factor Authentication

Sparkbox requires that all members of the Sparkbox organization in Github set up [two-factor authentication](https://github.com/sparkbox/standard/blob/master/security/two-factor-authentication.md) and use a tool like [Authy](https://authy.com/) or the built-in [two-factor authentication support in 1Password](https://support.1password.com/one-time-passwords/) instead of using an SMS number.

## Soon Expired Bot

[Soon Expired](https://github.com/sparkbox/soonexpired) is a Slack integration we created to monitor domains for expired SSL certificates. SSL certificiates are important for creating a secure connection between the browser and the web server.

## VPN

Sparkbox partners with [DataYard](https://datayard.us) for a VPN so that team members can connect from anywhere and have their connection encrypted. Being connected to the VPN also allows us to connect to other clients' internal network resources.

## `npm audit`

When working on Node based projects, we use [`npm audit`](https://docs.npmjs.com/cli/audit) to assess security vulnerabilities in package dependencies for our projects.

## OWASP ZAP

We use the free and open source tool [OWASP Zed Attack Proxy (ZAP)](https://www.zaproxy.org/) to find security vulnerabilities in our applications.
