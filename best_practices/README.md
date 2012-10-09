Best Practices
==============

How to take what we have learned and apply it. Also, how to avoid mistakes we have already made.

General
-------

* Everyone is responsible for quality.
* Content on websites should be available to as many people as possible.
* JS should not be required to view primary content on a website.
* Assets on sites should not specify a protocol (http or https) and should be absolutely relative from the root.


EE
-------

* Don't use the structure_entries plug-in.
* Favor [Pixel & Tonic](http://pixelandtonic.com/) plug-ins. 
* Don't spend time writing a new plug-in when one can be purchased.
* When a client project has more than just a few pages, use [Structure](http://buildwithstructure.com/) for site organization.
* Check each page type in debug mode, and look at the number of queries and page size. Anything over 125 queries and 10 MB should be cause for concern.


Email
-------

* Use [SendGrid](http://sendgrid.com) to deliver email from code.
* Use [MailChimp](http://mailchimp.com/) for subscription mailing lists.


Testing
-------

* Write unit tests whenever possible.
* Write integration tests whenever possible.
* Everything should be tested before the client has a chance to find problems.
* All issues should be tracked in Github.

Browsers
-------



Devices
-------

* Device testing should be done on all available devices (and we have several of them).