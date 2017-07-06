# Drupal

## Best Practices

### Manage Dependencies with Composer

We use [Composer](https://getcomposer.org/) to manage dependencies like Drupal Core, modules, themes, and PHP libraries.

We recommend using the [Drupal Project template](https://github.com/drupal-composer/drupal-project) as a starting place for a Drupal site that uses composer.

### Treat Configuration as Code

We encourage a workflow where site configuration is stored in the codebase as `.yml` files and checked into git. This reduces the risk of issues in production and allows for automated, preditable, deployments and rollbacks.

The development workflow usually entails making configuration changes in the UI, exporting them with [drush](http://www.drush.org/en/master/), and commiting them with Git. Upon deployment, we can run a task to import any new configuration that was deployed.

We should reduce the risk of non-code configuration changes in production by restricting the permissions of common user roles to only allow content changes.

### Use Drupal Coding Standards

When writing custom code, follow [the Drupal Coding Standards](https://www.drupal.org/docs/develop/standards), as documented on Drupal.org.

Several tools exist for linting against these standards including [phpcs+coder](https://www.drupal.org/project/coder), [Drupal's ESLint config](https://www.drupal.org/docs/develop/standards/javascript/eslint-settings), and [CSSComb](https://www.drupal.org/docs/develop/standards/css/csscomb-settings-for-drupal-css-formatting-and-sort-tool).

### Stay on top of security updates

Drupal core security announcements are posted at https://www.drupal.org/security, which you can subscribe to via email or RSS. Composer makes Drupal core updates easy so there's no reason to get behind.
