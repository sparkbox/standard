Divshot 
========

Our static site service of choice

How to set up Divshot and CircleCI for a new project
----------------------------------------------------

### Divshot.io Actions

First thing to do is set up a new Divshot app via the [divshot.io](http://divshot.io) dashboard.

![](http://files-misc.s3.amazonaws.com/create-app.png)

Once you've set up the app with divshot, go to the CLI and `divshot init` an app with the same name. 

*Note:* `divshot init` will ask you to add the app to Divshot, don'd do this since we've already created the app via the website.

Install the [divshot-cli](https://github.com/divshot/divshot-cli#install) by running:

`npm install divshot-cli -g`

Running `divshot init` will generate a new file called `divshot.json` in the root of your project. It should look something like this:

`divshot.json` example file:
```json
{
  "name": "project-name",
  "root": "dist",
  "clean_urls": true,
  "error_page": "error.html"
}
```

To kick off the first deploy, type `divshot push production` to push to divshot's production environment. `divshot push` will by default push to the Development environment.

### Set up some authentication 

[Authentication with Divshot](http://docs.divshot.com/guides/http-authentication) is a snap.

`divshot protect [environment] [username:password]`

At this time it's only possible to have one set of credentials. Once you've added credentials [add them to 1Password](https://github.com/sparkbox/how_to/tree/master/software/1password).

### Set up a custom domain (optional)

We like to route most of our QA through our own `sparkboxqa` domain. [Setting this up with divshot](http://docs.divshot.com/guides/domains) is pretty simple.

Note that this only works for the Production environment. If you are using Divshot's promotion system you will have to use the default `staging.app-name.divshot.io` domain names.

### Add some CircleCI to your life

There are a few new files and configuration pieces that need to be set up before the deployments start flowing like wine. 

1. **Add the project repo to CircleCI**.
![](http://files-misc.s3.amazonaws.com/add-project.png)

2. **Add divshot-cache to `.gitignore`**

3. **Add necessary npm modules (e.g. grunt-cli) to `package.json`:**
`npm install divshot-cli grunt-cli bower --save-dev`
4. **Add a `circle.yml` file to the project**

`circle.yml` contains the [configuration for CircleCI](https://circleci.com/docs/configuration). It controls things like: 

  - the command to build the project
  - how to install dependencies
  - instructions on how to deploy the project after it's built

Here is a `circle.yml` example file:
```yml
dependencies:
  post:
    - node_modules/.bin/bower install

test:
  override:
    - node_modules/.bin/grunt dist

deployment:
  staging:
    branch: master
    commands:
      - node_modules/.bin/divshot push staging --token $DIVSHOT_TOKEN

#optional cleanup
general:
  artifacts:
    - "dist"
```

### Other Configuration

The `$DIVSHOT_TOKEN` in `circle.yml` is an environment variable from CircleCI. 

This gives CircleCI the authority to push to Divshot. To begin, you must [get your token from Divshot](https://github.com/divshot/divshot-cli#authtoken) using the CLI.

Once you have your token, the next step is to add it to CircleCI as an environment variable like so:

![](http://files-misc.s3.amazonaws.com/env.gif)

Once this token is set up the `deployment` command in our `circle.yml` file: `node_modules/.bin/divshot push production --token $DIVSHOT_TOKEN` will push to Divshot correctly.

You can run this locally to test things out to make sure your token is working correctly.

### Debugging

You're done! Ideally, whenever the `master` branch of the project is updated, CircleCI will deploy to Divshot automatically.

You can watch the CircleCI process build your project by heading over to CircleCI and clicking on the status of the right most icon (the most recent or running deploy)

![](http://files-misc.s3.amazonaws.com/icon.png)

You can [`ssh` into a CircleCI build](https://circleci.com/docs/ssh-build) to investigate failures.

![](http://files-misc.s3.amazonaws.com/ssh.png)

