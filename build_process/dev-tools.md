# Dev Tools
A running list of dev tools that we use on our projects.

## CSS tooling
* [Sass](https://sass-lang.com/) via [sass](https://www.npmjs.com/package/sass): for CSS preprocessing.
* [Stylelint](https://www.npmjs.com/package/@sparkbox/stylelint-config-sparkbox): linting for CSS with our preferred configuration.
* [PostCSS](https://github.com/postcss/postcss): for CSS post-processing.
  * [postcss-cli](https://github.com/postcss/postcss-cli): for running PostCSS via the command line and within your build.
  * [Autoprefixer](https://github.com/postcss/autoprefixer): for parsing CSS and adding vendor prefixes automatically, based on a configuration file.

## JavaScript tooling
* [Webpack](https://webpack.js.org/): for JavaScript bundling. Can also be used for CSS.
* [Babel](https://babeljs.io/): for transpiling JavaScript. Allows you to use "next generation" JS, and have it work in current (and older) browsers.
* [ESLint](https://eslint.org/): for linting JavaScript.
  * [eslint-config-sparkbox](https://github.com/sparkbox/eslint-config-sparkbox): for linting JavaScript with our preferred configuration.
* [Lodash](https://lodash.com/): for providing a library of JS utilities.
* [core-js](https://github.com/zloirock/core-js): for polyfilling JavaScript.

## Other tools we use in our builds
* [rimraf](https://github.com/isaacs/rimraf): for removing directories via scripts—the UNIX command `rm -rf` for node.
* [npm-run-all](https://github.com/mysticatea/npm-run-all): for running multiple npm-scripts in parallel or sequential via the CLI or in a build process.
* [glob](https://github.com/isaacs/node-glob): for matching files using the patterns the shell uses—a glob implementation in JavaScript.
* [chokidar](https://github.com/paulmillr/chokidar): for watching your files for changes.
* [pa11y](https://github.com/pa11y/pa11y): for automated accessibility checking.
