# Site Completeness Checklist

## Early Dev Checklist 

### Hosting

* [ ] Automated Deployments
* [ ] Preproduction Environments: Disallows indexing
* [ ] Preproduction Environments: Require Basic Authentication
* [ ] Preproduction Environments: Whitelist the Sparkbox network - [instructions] (./project_management/htaccess_snippets.md)
* [ ] Purchase CMS license (if applicable)
* [ ] Transition/Purchase Font accounts in Customer Specific Account

### DevOps

* [ ] Record deployments using a service like [Rollbar]
* [ ] Capture and Monitor ongoing performance using a service like [NewRelic]
* [ ] Assure log rotation is in place using a utility like [LogRotate]
* [ ] Require SSL

### Design

* [ ] Hi-Res (retina-ready) images for any images that are vector/text
based
* [ ] favicon.ico - use [favicon generator](http://realfavicongenerator.net), seriously.

### Content

* [ ] 404 page
* [ ] search results page
* [ ] copyright page
* [ ] terms of use page
* [ ] any other legal page
* [ ] credit page / sparkbox link
* [ ] humans.txt included
* [ ] robots.txt file pointing to sitemap.xml
* [ ] sitemap.xml
* [ ] meta tags (description)
* [ ] page titles appropriate and SEO
* [ ] imgs with alt text
* [ ] img title attributes appropriate and SEO

### Markup/CSS/JS Related

(in dynamic content)
* [ ] basic link styles
* [ ] blockquotes
* [ ] unordered lists
* [ ] ordered lists
* [ ] all 6 header tags
* [ ] inline images (left, right, center, etc in CMS content)
* [ ] print stylesheet
* [ ] jump to content link near top of markup (for accessibility)
* [ ] check for empty (href=#) links
* [ ] dynamically generated copyright date
* [ ] form validation in place
* [ ] error styles
* [ ] form required fields tested
* [ ] forms submit properly
* [ ] HTML validated
* [ ] CSS validated
* [ ] No JS errors
* [ ] CSS in the header
* [ ] JS in the footer
* [ ] Run Through [a11yproject](http://a11yproject.com/checklist.html) accessibility checklist
* [ ] Automated [cache-busting](https://css-tricks.com/strategies-for-cache-busting-css/) of CSS and JS assets
    - Consider the Sparkbox [cachebust package](https://github.com/sparkbox/cachebust) for node builds
### Testing

Desktop
* [ ] are we going to have compatibility mode issues in IE?
* [ ] content accessible in IE 7,8,9
* [ ] design/content right in IE 9/10
* [ ] design/content right in Micrsoft Edge
* [ ] design/content right in latest PC Chrome
* [ ] design/content right in latest PC FireFox
* [ ] design/content right in latest Mac Safari
* [ ] design/content right in latest Mac Chrome
* [ ] design/content right in latest Mac FireFox
* [ ] design right on a retina display

Devices
* [ ] design/content right in iOS phone
* [ ] design/content right in iOS tablet
* [ ] design/content right in Android phone
* [ ] design/content right in Android tablet
* [ ] design/content right in Blackberry phone
* [ ] design/content right in Blackberry tablet
* [ ] design/content right in Kindle tablet
* [ ] design/content right in Windows phone
* [ ] design/content right in Windows tablet

###  Plan Launch

* [ ] Determine hosting solution.
* [ ] Determine launch plan. (staging environment, DNS changeover, etc)
* [ ] Get client’s google tracking ID.
* [ ] Get client’s mail marketing (mailchimp) ID.
* [ ] Get client’s social share ID’s.
* [ ] Get client’s social pages.

---

## Launch Checklist

* [ ] allow indexing
* [ ] Markup/CSS/JS Related
* [ ] include google analytics (proper UA string)
* [ ] Un-Comment-Out the Google Analytics ID so it works post launch.
* [ ] ensure local jquery files are in place
* [ ] local jquery version should be same as google jquery version
* [ ] add selectivizr only if needed
* [ ] add modernizr only if needed
* [ ] build custom version of modernizr (keep file small)
* [ ] Transition Typeography.com fonts to Production mode
* [ ] Assure [assets are fingerprinted](https://seesparkbox.com/foundry/automation_ftw_bust_your_cache) possibly with [`cachebust`](https://github.com/sparkbox/cachebust)

### Server Related

* [ ] The site is backed up
* [ ] Using expires headers
* [ ] Using gzip
* [ ] Minifying and combining our CSS
* [ ] Include caching option
* [ ] Page weight has been tested and is acceptable.

## Post Launch Checklist

### Project Management Related

After we launch a site, this is the procedure that we will follow. We
will wait approximately 14 days to allow for last minute changes,
bugs, etc.

* [ ] send thank you note after final payment is received and remind of
    30-day support timeframe
* [ ] Send documentation to client. (Check that code is commented well,
    send plugin list, any live or documented training)
* [ ] Archive live code. (Repository or Basecamp.)

### Marketing

* [ ] Submit to Galleries
* [ ] Add to seesparkbox.com work section
* [ ] Blog about launch
* [ ] Tweet from @hearsparkbox
* [ ] Request client quote/recommendation (if appropriate).

### Gallery Submittal:

1. [ ] We do a “normal submission” on www.awwwards.com because
it is well respected and well screened
http://www.awwwards.com/submit
for around $21

2. [ ] Then we use http://thecssgallerylist.com/ for sheer volume to
submit to 100 other sites (hitting many popular ones) for $20.

3. [ ] Then we hand-submit the site to a few other purposeful (but free)
galleries such as:
mediaqueri.es
http://www.mobileawesomeness.com/
http://creattica.com/

[Rollbar]: https://rollbar.com
[NewRelic]: https://newrelic.com
[LogRotate]: https://support.rackspace.com/how-to/understanding-logrotate-utility/
 
