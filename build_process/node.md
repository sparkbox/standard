# Node

## NPM Scripts

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

