# PHP Coding Standards
![PHP logo](php-logo.png)

Despite being one of the most used languages for building web applications, PHP doesn't have the best reputation. We use a number of frameworks that are built with PHP. In order to avoid PHP's reputation of messy codebases, we utilize [PHP_CodeSniffer][phpcs] to detect violations of defined coding standards.

### Picking a standard
Many frameworks have their own standards declared. We use the framework's defined standards when possible. For instance, when developing a WordPress theme, we utilize the [WordPress Standard][wp]. If there is not a standard defined, or we are not using a framework, we use the [PSR-2 Standard][psr-2]. These are the standards for some of our commonly used frameworks:

- [PSR-2 / Default][psr-2]
- [WordPress][wp]
- [Symfony][symfony]
- [Drupal][drupal]

### Enforcing a standard

[PHP_CodeSniffer][phpcs] allows us to lint our PHP. To install PHPCS, do the following:

1. Install PHP CodeSniffer:

    `composer global require "squizlabs/php_codesniffer=*"`
1. Ensure you have access to global composer installs. In your .zshrc or .bashrc file, make sure you have the following:

    `export PATH=~/.composer/vendor/bin:$PATH`

3. Install Coding Standards:

<details>
  <summary>PSR-2 Coding Standard</summary>
  <p>PSR-2 is installed by default with phpcs</p>
</details>

<details>
  <summary>Drupal Coding Standard</summary>
  <ol>
    <li>Install Drupal Standard
      <pre>composer global update drupal/coder --prefer-source</pre>
    </li>
    <li>Register Drupal standards in PHP Codesniffer
      <pre>composer global require drupal/coder:^8.3.1</pre>
      <pre>composer global require dealerdirect/phpcodesniffer-composer-installer</pre>
    </li>
  </ol>
</details>

<details>
  <summary>Symfony Coding Standard</summary>
  <p>Symfony follows PSR-2 with a few additional standards.</p>
  <ol>
    <li>Install the coding standard as a dependency of your project
      <pre>composer require --dev escapestudios/symfony2-coding-standard:3.x-dev</pre>
    </li>
    <li>Add the coding standard to the PHP_CodeSniffer install path
      <pre>phpcs --config-set installed_paths vendor/escapestudios/symfony2-coding-standard</pre>
    </li>
  </ol>
</details>

<details>
  <summary>WordPress Coding Standard</summary>
  <ol>
    <li>Install WordPress Standard
      <pre>git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git ~/wpcs</pre>
    </li>
    <li>Register WordPress standards in PHP Codesniffer
      <pre>phpcs --config-set installed_paths /Users/<your-user>/wpcs</pre>
    </li>
  </ol>
</details>

4. To verify the selected standard(s) were installed correctly, list installed standards with `phpcs -i`

### Setting Up Visual Studio Code to recognize linters

**Extensions Required:**
- [phpcs][phpcs_vscode]: provides integration for PHP CodeSniffer (phpcs) code linting

**Extensions: Bonuses:**
- [PHP DocBlocker][docblocker]: provides auto-complete for PHP docblocks
- [PHP Intelephense][intelephense]: provides support for PHP code completion and intellisense that supports any PHP file extension
- [PHP Intellisense][intellisense]: provides support for PHP code completion and intellisense but only for files using the PHP extension
- [Drupal 8 Extensions][drupal8]
- [Drupal 7 Extensions][drupal7]

To see the linter in your editor, set up per-project vsCode settings.
<details>
  <summary>Example Drupal Standards VScode Config</summary>

  ```PHP
  {
    "phpcs.enable": true,
    "phpcs.standard": "Drupal",

    /* Editor Suggestions / Optional */
    "breadcrumbs.enabled": true,
    "editor.tabSize": 2,
    "editor.autoIndent": "full",
    "editor.formatOnSave": false,
    "editor.renderWhitespace": "boundary",
    "editor.wordWrapColumn": 80,
    "editor.wordWrap": "off",
    "editor.detectIndentation": true,
    "editor.rulers": [ 80 ],
    "files.associations": {
      "*.inc": "php",
      "*.module": "php",
      "*.install": "php",
      "*.theme": "php",
      "*.tpl.php": "php",
      "*.test": "php",
      "*.php": "php"
    },
    "html.format.enable": true,
    "html.format.wrapLineLength": 80,
    "telemetry.enableTelemetry": false,
  }
  ```
</details>

<details>
  <summary>Example WordPress Standards VScode Config</summary>

  ```PHP
  {
    "phpcs.enable": true,
    "phpcs.standard": "WordPress",

    /* Editor Suggestions / Optional */
    "editor.insertSpaces": false,
    "editor.tabSize": 4,
    "intelephense.files.maxSize": 3200000
  }
  ```
</details>

### Setting Up circleCI to Run Code Checker:

CircleCi provides orbs, which are reusable snippets of code. Orbs help automate repeated processes, speed up project setup, and make it easy to integrate with third-party tools.

These are some example orbs:
- [WordPress phpcs orb][drupal_orb]
- [Drupal phpcs orb][wp_orb]

When a public orb doesn't fit the needs of a project, we can set up a custom CircleCi setting by modifying an existing orb or creating a new config from scratch. View a [custom WordPress config example here][wp_custom].

<!-- Links are defined below to make markdown above more readable -->
[wp]: https://github.com/squizlabs/PHP_CodeSniffer
[phpcs]: https://github.com/squizlabs/PHP_CodeSniffer
[psr-2]: https://www.php-fig.org/psr/psr-2/
[symfony]: https://github.com/djoos/Symfony-coding-standard
[drupal]: https://git.drupalcode.org/project/coder
[drupal_docs]: https://www.drupal.org/docs/8/modules/code-review-module/installing-coder-sniffer#s-register-coder-standards
[phpcs_vscode]: https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs
[docblocker]: https://marketplace.visualstudio.com/items?itemName=neilbrayfield.php-docblocker
[intelephense]: https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client
[intellisense]: https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-intellisense
[drupal8]: https://www.drupal.org/docs/develop/development-tools/configuring-visual-studio-code#s-drupal-8-recommended-extensions
[drupal7]: https://www.drupal.org/docs/develop/development-tools/configuring-visual-studio-code#s-drupal-7-recommended-extensions
[drupal_orb]: https://circleci.com/orbs/registry/orb/kanopi/ci-tools#usage-phpcs-drupal-simple
[wp_orb]: https://circleci.com/orbs/registry/orb/kanopi/ci-tools#jobs-phpcs-wordpress
[wp_custom]: https://github.com/rfearing/wp-phpcs-docker-circleci-example/blob/master/.circleci/config.yml
