# Hosting

We often need to make hosting decisions when building products for our clients. In general, we embrace cloud-based hosting because of its low cost, flexibility, ease of use, and ability to scale.

There lots of hosting options, so it can be useful to divide them into two major categories: Infrastructure as a Service (IaaS) and Platform as a Service (Paas).

## Categories

|                 | Infrastructure as a Service (IaaS)                 | Platform as a Service (Paas)                                          |
| --------------- | -------------------------------------------------- | --------------------------------------------------------------------- |
| Examples        | AWS, Rackspace, Digital Ocean                      | Heroku, Netlify, Platform.sh                                          |
| Common features | Root access, server selection, OS selection, etc.  | Built-in support for SCM integration, environments, secrets, CI, etc. |
| Cost            | Usually lower (not including developer time)       | Usually higher (not including developer time)                         |
| Maintenance     | Requires environment setup and routine maintenance | Minimal                                                               |
| Scalability     | Good                                               | Good                                                                  |
| Main benefit    | Lots of control / customization                    | Very productive if it fits what you need                              |

**Note**: many providers, like AWS, offer services in both the IaaS and PaaS categories

## Considerations

The category and hosting service we select depends on our client's needs. Here are some factors that could influence our decision:

- Existing hosting services that the client team is using or familiar with
- Size and operational experience of the client's technical team
- Expected scale of the client's project (or future projects)
- Need for customization
- Technologies we will be using

Below is an overview of some of the hosting services we've used successfully in the past.

### AWS

Amazon Web Services (AWS) is one of the earliest and most common cloud infrastructure providers around. They have a massive ecosystem of services that all integrate with each other, giving developers a lot of control in how they build out their products.

The ubiquity of AWS makes it easy to find tooling and documentation around their products. It also makes finding developers with prior AWS experience easy. AWS often uses metered pricing, which can make it difficult to predict final costs (though [their calculators](https://calculator.aws) can help with this).

### Rackspace

Rackspace is a mature hosting service that provides virtual machines for end-to-end hosting needs. Rackspace offers good customer support, predictable pricing, and full control over the machines you are using.

### Heroku

Heroku is a managed hosting platform that allows developers to focus on building their application. Heroku uses knowledge of the application to manage builds, deploys, and scaling. For example, with a `git push`, Heroku can scan the codebase, identify the application, choose an environment, install dependencies, and deploy. This ease-of-use comes with some constraints (ephemeral file system, Heroku-specific constructs, etc), but Heroku provides sane defaults and the ability to configure custom workflows depending on needs.

Hosting with Heroku can become expensive, especially as it scales, but this is offset by reducing operational setup and ongoing maintenance.

### Netlify

Netlify is a robust hosting platform for static websites. This focus allows them to automate frontend workflows and provide services for backend features that static sites often need. For example, we can add features like SSL certs, form submission, serverless functions, and basic password protection with just a few clicks in the dashboard.

Like Heroku, Netlify hosting can become expensive as it scales, but it offers easy setup, SCM integration, and a generous free tier, which makes it a good fit for quick experiments, design systems, and other static projects.

### Application-specific hosting

Some hosting services are designed with specific applications in mind. This can help automate deployment and streamline common workflows. Here are some examples of these kinds of hosting services that we've used successfully in the past:

- Acquia (Drupal)
- Pantheon (Drupal/Wordpress)
- Shopify (ecommerce)

## Conventions

See [this document for server naming conventions](../naming_conventions/servers.md).
