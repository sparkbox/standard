Best Practices
==============

How to take what we have learned and apply it. Also how to avoid mistakes we have already made.

General
-------

* Content on websites should be available to as many people as possible.
* JS should not be required to view primary content on a website.
* Everyone is responsible for quality.
* Assets on sites should not specify a protcol (http or https) and should be absolutly relative from the root.


EE
-------

* Don't use the structure_entries plug-in.
* Favor Pixel and Tonic plug-ins. 
* Don't spend longer writing a new plug-in when one can be purchased.
* When more than just a few pages use Structure for site organization.
* Check each page type in debug mode and look at the number of queries and the page size. Anything over 125 queries and 10 MB should be cause for concern.


Email
-------

* Use [SendGrid](http://sendgrid.com) to deliver email from code.
* Use [MailChimp](http://mailchimp.com/) for subscription mailing lists.


Testing
-------

* Write unit tests whenever possible.
* Write intergration tests whenever possible.
* Everything should be tested before the client has a chance to find problems.
* All issues should be tracked in github.

Browsers
-------



Devices
-------

* Device testing should be done on all available devices (And we have several of them).