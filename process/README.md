Process
==============

How to get things done and play nicely with others.

General
-------

* All code should be under source control.
* Please don't check in build artifacts. (Don't check in css files if we are using sass). This always leads to pain and suffering.
* All changes should go through source control and the deployment process.
* Don't throw nerf darts at [Dom](http://seesparkbox.com/about/dominique_richardson/).
* Don't put mint oreos in the oreo jar, they'll all taste like mint oreos then.
* Don't be afraid to ask questions!


Workstation Setup
-------
* Use whatever editor makes you the happiest.
* Install Ruby.
* 


Repository Setup
-------

* The root of the repository should be reserved for the main deliverable for the project.
* Planning documents should go in the "planning" folder in the root.
* Templates (if they are not the main deliverable) should go in the "templates" for in the root.
* Use the following directory names on the root of your work folder: 'sass', 'css', 'js', 'images'.



When you know you are done
-------

A task is done when the following criteria is met.

* The code is committed and pushed to github. 
* All applicable unit tests have been developed and run successful. 
* Code is deployed to staging environment.
* If front-end code that it has been browser and device tested.


Deploy
-------

* All projects should use [capistrano](https://github.com/capistrano/capistrano)
* Deployment should be able to be run using the command "cap deploy"
* All necessary artifacts (css generation and minifying javascript) should be done as part of the deploy.


Server
-------

* Databases backups should be setup before the site goes line and should be kept for a minimum of 10 days.
