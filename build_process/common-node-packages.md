#Commonly Used Node Packages

_Updated July 2019_

## Linting
**[eslint]** "ESLint is a tool for identifying and reporting on patterns found in ECMAScript/JavaScript code."

**[eslint-plugin-import]** "This plugin intends to support linting of ES2015+ (ES6+) import/export syntax, and prevent issues with misspelling of file paths and import names."

**[babel-eslint]** "babel-eslint allows you to lint ALL valid Babel code with the fantastic ESLint." _NOTE:_ "You only need to use babel-eslint if you are using types (Flow) or experimental features not supported in ESLint itself yet."

**[eslint-config-airbnb]** "provides Airbnb's .eslintrc as an extensible shared config."

**[eslint-plugin-jsx-a11y]** "Pairing this plugin with an editor lint plugin, you can bake accessibility standards into your application in real-time."

**[eslint-plugin-react]** "React specific linting rules for ESLint"

**[stylelint]** "A mighty, modern linter that helps you avoid errors and enforce conventions in your styles."

**[stylelint-scss]** "A collection of SCSS specific linting rules for stylelint (in a form of a plugin)."

**[eslint-config-sparkbox]** "A set of eslint customizations that we use at Sparkbox."


## CSS
**[autoprefixer]** "PostCSS plugin to parse CSS and add vendor prefixes to CSS rules using values from Can I Use."

**[node-sass]** Natively compiles .scss files to css using LibSass, the C version of the popular stylesheet preprocessor, Sass.

**[postcss-cli]** A CLI tool for interacting with PostCSS. PostCSS is a tool "for transforming styles with JS plugins. These plugins can lint your CSS, support variables and mixins, transpile future CSS syntax, inline images, and more."


## JavaScript
**[babel-loader]** "Allows transpiling JavaScript files using Babel and webpack."

**[webpack]** "webpack is a module bundler. Its main purpose is to bundle JavaScript files for usage in a browser, yet it is also capable of transforming, bundling, or packaging just about any resource or asset."

**[babel-core]** This is the Babel compiler core. "Babel is a toolchain that is mainly used to convert ECMAScript 2015+ code into a backwards compatible version of JavaScript in current and older browsers or environments."

**[@babel/core]** A more recent version of the Babel core. We should be using this one instead of `babel-core`.

**[@babel/preset-env]** "a smart preset that allows you to use the latest JavaScript without needing to micromanage which syntax transforms (and optionally, browser polyfills) are needed by your target environment(s)."


## Node/Operations
**[shelljs]** "ShellJS is a portable (Windows/Linux/OS X) implementation of Unix shell commands on top of the Node.js API. You can use it to eliminate your shell script's dependency on Unix while still keeping its familiar and powerful commands."

**[npm-run-all]** "A CLI tool to run multiple npm-scripts in parallel or sequential."

**[chokidar]** "A neat wrapper around node.js fs.watch / fs.watchFile / FSEvents." Resolves problems with node.js fs.watch and fs.watchFile.

**[rimraf]** "The UNIX command rm -rf for node."

**[express]** "Fast, unopinionated, minimalist web framework for node."

**[globby]** A nicer version of `fast-glob`, which "provides methods for traversing the file system and returning pathnames that matched a defined set of a specified pattern according to the rules used by the Unix Bash shell with some simplifications, meanwhile results are returned in arbitrary order."


[autoprefixer]: (https://www.npmjs.com/package/autoprefixer)
[node-sass]: (https://www.npmjs.com/package/node-sass)
[shelljs]: (https://www.npmjs.com/package/shelljs)
[babel-loader]: (https://www.npmjs.com/package/babel-loader)
[npm-run-all]: (https://www.npmjs.com/package/npm-run-all)
[postcss-cli]: (https://www.npmjs.com/package/postcss-cli)
[webpack]: (https://www.npmjs.com/package/webpack)
[chokidar]: (https://www.npmjs.com/package/chokidar)
[eslint]: (https://www.npmjs.com/package/eslint)
[eslint-plugin-import]: (https://www.npmjs.com/package/eslint-plugin-import)
[babel-core]: (https://www.npmjs.com/package/babel-core)
[babel-eslint]: (https://www.npmjs.com/package/babel-eslint)
[eslint-config-airbnb]: (https://www.npmjs.com/package/eslint-config-airbnb)
[eslint-plugin-jsx-a11y]: (https://www.npmjs.com/package/eslint-plugin-jsx-a11y)
[eslint-plugin-react]: (https://www.npmjs.com/package/eslint-plugin-react)
[rimraf]: (https://www.npmjs.com/package/rimraf)
[stylelint]: (https://www.npmjs.com/package/stylelint#features)
[stylelint-scss]: (https://www.npmjs.com/package/stylelint-scss)
[@babel/core]: (https://babeljs.io/docs/en/next/babel-core)
[@babel/preset-env]: (https://www.npmjs.com/package/@babel/preset-env)
[eslint-config-sparkbox]: (https://www.npmjs.com/package/eslint-config-sparkbox)
[express]: (https://www.npmjs.com/package/express)
[globby]: (https://www.npmjs.com/package/globby)
