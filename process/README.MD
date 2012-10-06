Process
==============

How to get things done and play nicely.

General
-------

* All code should be under source control.


Repository Setup
-------

* The root of the repository should be reserved for the main deliverable for the project.
* Planning documents should go in the "planning" folder in the root
* Templates (if they are not the main deliverable) should go in the "templates" for in the root



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
