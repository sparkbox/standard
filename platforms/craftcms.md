# CraftCMS

## Best Practices

### Prefer the [Pro license](https://craftcms.com/pricing)

Sparkbox always recommends a [principle of least privilege][leastprivilege] and unique user accounts rather than shared accounts. In most cases, Sparkbox team members will require admin access to setup, maintain, and support your site. The Pro license supports this where the reduced Client license would limit the site to one admin and one client. This will almost never be enough accounts. It also encourages the use of share accounts which would be a security concern.

### Prefer [Mina-Circle] Deployment

CraftCMS is well suited to deployment within [Heroku]. Heroku matches many of the principles Sparkbox looks for in a deployment and hosting strategy. Unfortunately, very rarely do we see clients go live with a Heroku hosting plan. To stay with Heroku during development means our team practices the steps of production deployments less frequently. This is a significant risk.

Instead, we recommend a Staging environment using a "SparkboxQA" server or a client pre-production environment. Deployment to this environment should be done via Mina, preferrably using Mina-Circle.

[Heroku]: https://heroku.com
[Mina-Circle]: https://github.com/sparkbox/mina-circle
[leastprivilege]: https://en.wikipedia.org/wiki/Principle_of_least_privilege
