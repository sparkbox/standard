# Build, Deployment, and Delivery

We believe that the more frequently we deploy, the better we collaborate as a
team and with our clients, navigating our way toward the most appropriate
outcome.

Our expectation is that anyone on our development team should be able to build 
and deploy within a few moments of cloning a project repository.

---

## In This Guide
### Build
  * [What is a "Build Process"?](#what-is-a-build-process)
  * [How We Do Build Processes at Sparkbox](#how-we-do-build-processes-at-sparkbox)
  * [Common Build Tasks](#common-build-tasks)

### Deployment
  * [Stages of Deployment](#stages-of-deployment)
  * [Deployments and Hosting](#deployments-and-hosting)
  * ["Review Apps" or "PR Deploys"](#review-apps-or-pr-deploys)

### Delivery
  * [Drops Process](#drops-process)

---

## Build

### What is a "Build Process"?
When we use the phrase "build process," we are describing an activity that translates source files into production-ready files. Typically, source code and files are written and created by humans, and the build artifacts—the "executable" code and other assets resulting from a build—are written or compiled via an automated process.

You may hear or see the term "task" or "build task." You can think of a build task as an individual piece of a larger build process. A build task can also serve as a single process that can be executed on its own, outside of the larger build process.

### How We Do Build Processes at Sparkbox
Our build process is Node-based, meaning that we rely on [Node](https://nodejs.org/en/) to translate our source files into production-ready files. Specifically, our build processes use [npm scripts](https://github.com/sparkbox/standard/blob/master/build_process/node.md#npm-scripts) to handle the translation of source files into build artifacts.

Note that in the past, we have used other Node-based build methods, including [Grunt](https://gruntjs.com/) and [Gulp](https://gulpjs.com/).

Ultimately, regardless of the tools we choose, our goal is to have a build process that fits our projects' needs and our clients' needs, and we strive to strike a balance between having a great developer experience and a great resulting project.

### Common Build Tasks
Build tasks are used to compile or transpile our source code into production-ready code.

These are some of our common build tasks:
* Compiling Sass to CSS
* Adding browser and vendor prefixes to our CSS by using PostCSS with Autoprefixer
* Transpiling JavaScript
* Optimizing and/or minifying code

---

## Deployment

Wikipedia [defines software deployment](https://en.wikipedia.org/wiki/Software_deployment) as "all of the activities that make a software system available for use." At Sparkbox, this most often means the act of moving a website or web app from a local environment to a "live" server.

### Stages of Deployment

At Sparkbox, we often refer to a project or deployment "pipeline"—a term we've borrowed from [Heroku](https://devcenter.heroku.com/articles/pipelines). A pipeline is the container for the various stages of deployment, which can typically consist of the following:

  * a remote "development" environment (aka "dev")
  * a remote "staging" environment
  * a remote "production" environment (aka "prod")

Other remote environments can exist within this pipeline (a QA, or quality assurance environment, for example), depending on the project's needs.

Given this pipeline structure, a deployment workflow can be established and automated wherein the project's code is tested in and escalated through each of the environments until it is deemed ready for its consumers and ultimately deployed to the production environment.

Often, we create URLs for each environment so that the project can be tested and viewed in each state of the pipeline. Note that access to each environment's URL, with the exception of the production environment, should be protected with a username and password. The usernames and passwords for those URLs are stored in 1Password so that the entire team has access to the environments.

### Deployments and Hosting

At Sparkbox, we tend to favor hosting services that allow for easy orchestration of deployment pipelines.

These are some services we prefer:
  * [Heroku](https://www.heroku.com/)
  * [Netlify](https://www.netlify.com/)

### "Review Apps" or "PR Deploys"

For projects that take advantage of deployment pipelines, we find it very helpful to enable "review apps" or "PR deploys." A review app or PR deploy can be described as a Git branch-based temporary deployment of the website or web app, which is created upon the initiation of a pull request. The PR deploy allows project contributors (and clients) to access a URL and view the current state of the project relative to the changes taking place in that branch and pull request. Heroku has helpful [documentation about their review apps](https://devcenter.heroku.com/articles/github-integration-review-apps).

---

## Delivery

### Drops Process

Sparkbox has put an immense amount of time, thought, and effort into its website and web app build process.

Our iterative [drops process](drops.md) is used to ease the handoff and integration of each increment where technologies often collide. This is a model most appropriate when Sparkbox is not involved in the final CMS integration.
