Process
==============

How to get things done and play nicely with others.

General
-------

* All code should be under source control.
* Please don't check in build artifacts. (e.g. Don't check in CSS files if we are using Sass.) This always leads to pain and suffering.
* All changes should go through source control and the deployment process.
* Don't throw Nerf darts at [Dom](http://seesparkbox.com/about/dominique_richardson/).


Workstation Setup
-------
* Use whatever editor makes you the happiest.
* Install Ruby.


Repository Setup
-------

* The root of the repository should be reserved for the main deliverable of the project.
* Planning documents should go in the "planning" folder in the root.
* Templates (if they are not the main deliverable) should go in the "templates" for in the root.
* Use the following directory names on the root of your work folder: 'sass', 'css', 'js', 'images'.



When You Know You Are Done
-------

A task is done when the following criteria is met.

* The code is committed and pushed to Github. 
* All applicable unit tests have been developed and run successfully. 
* Code is deployed to staging environment (e.g. sparkboxqa.com).
* If the project is front-end code, it has been browser and device tested.


Deploy
-------

* All projects should use [capistrano](https://github.com/capistrano/capistrano).
* Deployment should be able to be run using the command "cap deploy."
* All necessary artifacts (CSS generation and minifying JavaScript) should be done as part of the deploy.


Server
-------

* Database backups should be set up before the site goes live and should be kept for a minimum of 10 days.
