# Package Management

## Overview
We use [npm][npmCli] to package and distribute shared code.

Anything that can be shared can be [packaged as a module][packages]. This is not limited to JavaScript but can include SCSS/CSS, tooling, and other static assets, such as images.

## Why?
npm is the canonical solution to manage dependencies and build systems for front-end projects. These are some benefits of using npm:
- Discoverability
- Easy access to packages
- Normalized workflows
- Package stability
- Semantic versioning

Even if we choose a different tool to interact with packages, such as [yarn][yarn], or to manage versioning and publishing of packages, such as [lerna][lerna], they are still built to be compatible with the npm registry and package format. Understanding the packaging strategies established by npm helps us to be more productive when using secondary tooling.

## Semantic Versioning
As publishers, we are encouraged to read the [semver specification][semver]. It is very succinct and can help guide our decisions around versioning.

The semver strategy can be summarized as follows:

Given a version number MAJOR.MINOR.PATCH, increment the following:
- MAJOR version when making incompatible API changes
- MINOR version when adding functionality in a backwards compatible manner
- PATCH version when making backwards compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

Proper versioning is extremely valuable as an asynchronous communication channel. This is how we as publishers communicate what types of changes can be expected in each release of our software.

Semver is commonly understood to be important in open-source work, but it is equally important for closed-source projects. Internally facing systems can be consumed by multiple teams and used in multiple projects. Establishing good versioning practices early on is critical to the success of our projects.

It's important to know that semver is not perfect. Regardless of the strategies involved in incrementing versions (manual, [conventional commits][conventional], or anything else), new versions can only be as accurate as the people applying the version changes. Mistakes can happen. When mistakes do happen, we use [npm deprecate][deprecate] to communicate problematic version numbers for published packages.

## Creating
New open source packages created under the Sparkbox organization are typically [scoped][scope] to `@sparkbox`. This is not a hard rule, but it is highly encouraged.

To quickly create a new package, run `npm init -y --scope sparkbox`. This will create a `package.json` something like the following:
```js
{
  "name": "@sparkbox/standard",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/sparkbox/standard.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/sparkbox/standard/issues"
  },
  "homepage": "https://github.com/sparkbox/standard#readme"
}
```

We typically use private packages in client work (design systems, component libraries, various utilities). Consider scoping these to something company-appropriate to avoid naming collisions with open-source packages.

The following are additional fields that we add to our package.json files for most packages:
- [module][pkgModule] field – offers an ES-module-compatible entry point
- [files][pkgFiles] field – tells npm what files to add to a package when publishing
- [engines][pkgEngines] field – indicates compatible versions of node and npm

For a full list of valid fields and their semantics, see the [package.json documentation][pkg].

For [initial versions][initialVersion], we stick to the semver guidelines. We release a zero major (0.1.0) if we expect a lot of churn early on. This gives us time to establish our package's APIs before committing to a stable release. If we are comfortable with the stability of our initial release, then we start at 1.0.0.

## Publishing
For continuous integration systems, we [generate an auth token](https://docs.npmjs.com/creating-and-viewing-authentication-tokens) and [read it from the environment][12factor] in .npmrc before publishing.

```sh
$ echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ./.npmrc
$ npm publish
```

If we plan to run versioning from CI, it may require creating a [machine user][machine] to set up ssh or gpg keys for pushing and [signing versions][versionSign]. This can allow the CI system to make changes without attributing them to one team member.

We generally [pre-release][prerelease] versions when we need time to validate changes before promoting to a proper version. Pre-release versions can incorporate a semver compliant identifier. A good technique is to use the current git sha as an id to avoid repeated versions.

**We don't republish package versions**. Some private registries can be configured to allow republishing of package versions. Overwriting an existing package can lead to failed checksums when downloading or frustrating caching issues with the local npm cache.

## Security
Our personal registry accounts can enable [two-factor auth][2fa]. This can be enabled for user login [as well as publishing][2faPublish] from an authenticated account.

When possible, we [sign version tags][versionSign]. This can be done with the `-s` flag: `npm version <version> -s`.

[npmCli]: https://docs.npmjs.com/cli/npm
[pkg]: https://docs.npmjs.com/files/package.json
[packages]: https://docs.npmjs.com/about-packages-and-modules
[yarn]: https://yarnpkg.com/en/
[lerna]: https://github.com/lerna/lerna
[semver]: https://semver.org/
[pkgModule]: https://github.com/rollup/rollup/wiki/pkg.module
[pkgFiles]: https://docs.npmjs.com/files/package.json#files
[pkgEngines]: https://docs.npmjs.com/files/package.json#engines
[scope]: https://docs.npmjs.com/misc/scope
[initialVersion]: https://semver.org/#how-should-i-deal-with-revisions-in-the-0yz-initial-development-phase
[machine]: https://circleci.com/docs/2.0/gh-bb-integration/#controlling-access-via-a-machine-user
[versionSign]: https://docs.npmjs.com/cli/version#sign-git-tag
[prerelease]: https://semver.org/#spec-item-9
[conventional]: https://www.conventionalcommits.org/en/v1.0.0-beta.4/
[deprecate]: https://docs.npmjs.com/cli/deprecate
[2fa]: https://docs.npmjs.com/about-two-factor-authentication
[2faPublish]: https://docs.npmjs.com/requiring-2fa-for-package-publishing-and-settings-modification
[12factor]: https://12factor.net/config
