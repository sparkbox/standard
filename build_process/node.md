# Node

## Managing Your Local Node Versions

To manage your own Node versions we have a few recommendations, but you should do what works for you. Whichever method is reliable and comfortable is the right one.

### Happy Path

Use [`nvm`](https://github.com/nvm-sh/nvm). See documentation for [installation](https://github.com/nvm-sh/nvm#installation-and-update) and [usage](https://github.com/nvm-sh/nvm#usage). 

### Secondary Options

- [`n`](https://www.npmjs.com/package/n) - this is an `npm` install-able node-based tool. It's real nice.
- [`brew`](https://brew.sh/) - this is a perfectly fine option. See [instructions](./managing-node-with-brew.md) for using `brew`.

## Project Node Versions

All projects that rely on Node for build process or otherwise should use an [LTS release](https://github.com/nodejs/Release). The specific required version should be clearly defined for developers.

The `package.json` for any given project _should_ specify the required `node` version in the `engines` field. This field supports semver ranges. It looks like this...
```json
{
  "engines": {
    "node": "^10.0.0"
  }
}
```

## Version Automation

There are a few things we can do to help automate and/or enforce version requirements on a per-project basis. 

### Happy Path

Install [`node`](https://www.npmjs.com/package/node) as a `devDependency`. You can add the latest LTS release with `npm i -D node@lts`. With this, all `npm run` scripts (as well as [`npx`](https://www.npmjs.com/package/npx) run from the project root) will use the locally installed binary. Use the [`check-node-version`](https://github.com/parshap/check-node-version) package to check node, npm, or yarn versions in a `prestart` script. This will not automatically change node versions, but will add a fast failure when running `npm start` so developers know immediately of a need to switch versions. Use the `--package` flag to read version requirements directly from the `engines` field in `package.json`.

### Secondary Options 

- Use a [`.nvmrc`](https://github.com/nvm-sh/nvm#nvmrc) file. This will work for those who use [`nvm`](https://github.com/nvm-sh/nvm) to manage versions. The `nvm use` command will automatically pick up the version specified in `.nvmrc`.
- You can further automate version switching by extending your shell with [`avn`](https://github.com/wbyoung/avn). This is unlikely to be needed if projects are installing `node` as a devDep, but it is an option worth knowing about. The package supports `nvm`, `n`, and `brew`.

## `npm` Scripts

Our projects use different build systems (Gulp, Grunt, custom, etc), but many
times they have tasks that do similar things on every project. As developers
move from project to project we can save some cognitive overhead by
standardizing the commands we use for these common tasks. With node we can use
[npm scripts](https://docs.npmjs.com/misc/scripts) as shortcuts to our various
common tasks.

**Environment variables determine build type**

Builds for various environments (dev/prod) can tend to multiply build tasks.
Instead of using different commands for dev and production builds we can use
one standard command and use environment variables to determine the type of
build to execute.

`npm start` - The start script should start up the web server on production or otherwise run and serve a development build

**Running tests**

`npm test` - Setup your tests to run with this standard task for that purpose

**All other tasks**

`npm run` - If we setup all of our other tasks as uniquely-named NPM scripts,
developers can use this simple command to quickly determine all other tasks
available to them.

### `package.json`

- The default 'npm start' command is configured to run the `start.js` file which has conditional logic to run either
a production server or development build based on an environment variable.
- The `postinstall` script runs a production build so that the server is ready to serve immediately after deployment

```
{
  "name": "sample-project",
  "scripts": {
    "start": "node start.js",
    "prestart": "npm install",
    "serve": "node app.js",
    "dev": "[dev build/watch/serve scripts go here]",
    "postinstall": "[production build scripts go here]",
  },
  "dependencies": {
    "shelljs": "0.5.3",
  }
}
```

### `start.js`

- The production server needs the `NODE_ENV` environment variable set to `production`
- Using shell.js allows us to run npm scripts keeping all build tasks in `package.json`
- If no `NODE_ENV` value is found, a development environment is assumed so that local developers can start building with a simple `npm start`


```
import shell from 'shelljs';

let env = process.env.NODE_ENV;

if (env === 'production') {
  console.log('Starting Production...');
  shell.exec('npm run serve');
} else {
  console.log('Starting Development...');
  shell.exec('npm run dev');
}
```

