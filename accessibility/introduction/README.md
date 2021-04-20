# General Accessibility Guidelines & Introduction

## Our Accessibility Focus at Sparkbox

### Build Right, Build Better, Build Accessibly

For a long time, Sparkbox has had the goal to build right and to build a better web. In the past couple of years, we have invested in and focused on web accessibility as part of these goals: leveling up our developers with [certifications](https://www.accessibilityassociation.org/certification), bringing in people to do usability testing in person, and having a [Maker Series](https://seesparkbox.com/foundry/derek_featherstone_web_accessibility_and_inclusive_design) dedicated to the topic. We believe that all websites should be built accessibly and that accessibility should be a part of our whole process rather than a task we do at the end of a project. By prioritizing accessibility, we build websites that enable a wider audience to access the web while also providing a useful and enjoyable user experience.


### WCAG 2.1 AA Principles Compliance

Sparkbox aims to fulfill the principles of WCAG 2.1 AA, with an especial focus on the experiences of people with physical, hearing, and sight limitations who employ the use of screen readers or keyboard-only technology (the W3C [does not recommend](https://www.w3.org/TR/WCAG21/#cc1) requiring AAA compliance as it can be impossible to attain for certain types of content). Secondarily, we work to create good experiences for people who encounter color contrast issues and for users with cognitive disabilities. However, our user base focus may differ depending on the most common browsers or technologies utilized on our clients’ sites. 

We emphasize the **principles** of WCAG over the success criteria because even if someone builds a website that meets every single WCAG AAA success criterion, they may not actually create an accessible experience as a whole. Highlighting principles allows us to focus on the entire experience of the user as they browse a web page, and in this way, we can create a better and more accessible experience than just trying to “check off” boxes on an accessibility task list.

### Testing

In order to create accessible websites, Sparkbox not only thinks about accessibility at each stage of the process but also conducts extensive testing. We have a set of tools we employ to give us a high-level overview of potential accessibility issues, such as [pa11y](https://pa11y.org/), [Axe](https://www.deque.com/axe/), [Lighthouse](https://developers.google.com/web/tools/lighthouse), and [Wave](https://wave.webaim.org/). However, these kinds of automated tools are only able to find 30-50% of potential accessibility issues. Thus, we also emphasize that developers and designers test with common screen reader/browser combinations and keyboard-only navigation to get a real sense of other issues that may be present. At Sparkbox, we can use our own computers, BrowserStack, our QA devices in Dayton, and Virtual Machines to do this manual testing.

Since we also know that usability testing is crucial, we are working on finding a way to do user testing with people who use the technologies each day. We are excited to incorporate that into our process next.

**Sources**:
* [W3C: WCAG 2.1 Reference]
* [Deque: How to Get Development On Board with Accessibility Testing]
* [WebAIM: Accessibility User Testing]

## Accessibility is All or Nothing

It is important to note, especially for legal compliance, that accessibility is all or nothing. If there is even one inaccessible part of the page, the entire website can be classified as inaccessible. We need to be aware of this as an organization and ensure that we are thinking about accessibility in each of our roles and during each stage of building a website, from discovery to design to development.

## Disability Statistics

Everyone has been profoundly affected by technology and access to the web. For those living with disabilities, however, the effects have been even more meaningful and liberating. From the comfort of their home, they can now provide for themselves in many ways that were not possible before the internet. For example, people with disabilities can have jobs where they just need access to the internet to do work, can order and ship groceries to their homes, can access government and banking services online, and the list goes on.

However, if we do not build our websites with a focus on web accessibility practices, we limit the access of audiences with disabilities. Depending on the report and how disability is defined, this audience constitutes somewhere from [13%][The Rehabilitation Research and Training Center on Disability * Statistics and Demographics: 2018 Annual Report] to [19%][U.S. Census Bureau: Nearly 1 in 5 People Have a Disability in the U.S.] to [27%][Americans with Disabilities: 2014 Report] of the US population. In all of the sources reporting on disability statistics, the prevalence of types of disabilities remains consistent: having a physical impairment is the most common disability, followed by cognitive disabilities, and then hearing, sight, or speech impairments.

These statistics demonstrate that people with disabilities consist of a huge portion of the population. They also show that as we age, it is likely we will also develop a disability.

**Sources**:
* [WebAIM: Introduction to Web Accessibility]
* [U.S. Census Bureau: Nearly 1 in 5 People Have a Disability in the U.S.]
* [The Rehabilitation Research and Training Center on Disability * Statistics and Demographics: 2018 Annual Report]
* [Americans with Disabilities: 2014 Report]

##  Benefits of Web Accessibility

Everyone should be able to access the web. If this weren’t reason enough for us to build accessibly, we also see the following other benefits:

* A potential 27% increase of the consumer base of our websites 
* Decreased legal risk from ADA lawsuits
* Mobile and bandwidth-friendly websites
* Improved SEO and site-searchability rankings

Web accessibility benefits everyone, so let’s continue building a better web, built with accessibility in mind.

**Sources**:
* [Americans with Disabilities: 2014 Report]
* [WebAIM: Web Accessibility and SEO]
* [PopArt Studio: Inclusive Design: Making Websites Accessible to Everyone]

## Accessibility Guides

The following guides document the specific ways Sparkbox views and implements web accessibility related to:

* [Keyboard-Only Navigation](/accessibility/keyboard-accessibility/keyboard-accessibility.md)

### Future Installments - *Coming Soon*
* Screen Readers
* Color Contrast
* Cognitive Disabilities

[W3C: WCAG 2.1 Reference]: https://www.w3.org/TR/WCAG21/
[Deque: How to Get Development On Board with Accessibility Testing]: https://www.deque.com/blog/how-to-get-development-on-board-with-accessibility-testing/
[WebAIM: Accessibility User Testing]: https://webaim.org/blog/accessibility-user-testing/
[WebAIM: Introduction to Web Accessibility]: https://webaim.org/intro/
[U.S. Census Bureau: Nearly 1 in 5 People Have a Disability in the U.S.]: https://www.census.gov/newsroom/releases/archives/miscellaneous/cb12-134.html
[The Rehabilitation Research and Training Center on Disability * Statistics and Demographics: 2018 Annual Report]: https://disabilitycompendium.org/sites/default/files/user-uploads/Annual_Report_2018_Accessible_AdobeReaderFriendly.pdf
[Americans with Disabilities: 2014 Report]: https://www.census.gov/content/dam/Census/library/publications/2018/demo/p70-152.pdf
[WebAIM: Web Accessibility and SEO]: https://webaim.org/blog/web-accessibility-and-seo/
[PopArt Studio: Inclusive Design: Making Websites Accessible to Everyone]: https://www.popwebdesign.net/popart_blog/en/2018/12/inclusive-design-making-websites-accessible-to-everyone/