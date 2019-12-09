# JavaScript

[![JS Logo][producti]][product]

We write a lot of JavaScript. As the Web continues to grow and as users expect more dynamic interaction with websites, JavaScript has taken on an increasingly large role. However, we believe that it's also important to know when _not_ to use JavaScript. We prefer semantic HTML and CSS solutions whenever possible, and only reach for JavaScript to enhance these capabilities. We find that this approach helps to ensure that our work is accessible to the largest number of people possible.

## Style

Consistent code styling helps our teams work together better and can help prevent common JavaScript pitfalls. We rely heavily on manual code reviews to ensure the quality and functionality of the code we're writing, but prefer to automate code style enforcement as much as possible.
We use [ESLint][eslint] with a [custom configuration][eslint_config] to help enforce consistent code style.

## Modern Code, Old Browsers

Browser support is a constantly moving target. While we like to be forward-thinking with our code, it's also important to remain backwards-compatible. We use [Babel][babel] and [Webpack][webpack], along with appropriate [polyfills][polyfill], to allow us to use the most modern and awesome features of JavaScript while supporting the widest range of browsers.

## Static Types

We like the dynamic nature of JavaScript, but we also recognize the usefulness of static type checking. We like to use [TypeScript][typescript] when the need arises.

## Frameworks / Libraries

JavaScript has a rich ecosystem of libraries. Here are some of the tools we like to use.

- [React][react] - A view library for building user interfaces
- [Vue][vue] - Another view library for building user interfaces
- [Redux][redux] - A state management library
- [Axios][axios] - An [isomorphic][isomorphic] HTTP client
- [Lodash][lodash] - A utility library packed full of useful functionality
- [Moment][moment] - A date/time library
- [Chartist][chartist] - A responsive chart library

## Testing

Automated testing is an important part of our development process. Here are some of the tools we use to test.

- [Mocha][mocha] - A test runner
- [Chai][chai] - A test assertion library
- [Sinon][sinon] - A test mocking library
- [jsdom][jsdom] - A Node.js implementation of various browser APIs, useful for testing [DOM][dom] behavior
- [Enzyme][enzyme] - A utility for testing React components
- [Jest][jest] - Another test runner

### Mocha vs Jest comparison

Mocha is a fast, highly-configurable test runner but does not provide assertions or mocking out of the box. At Sparkbox, we typically use a combination of Mocha + Chai + Sinon, rolling in jsdom or Enzyme when appropriate for component testing.

Jest, on the other hand, provides a complete "out of the box" testing solution, including assertions, mocking, and jsdom with zero configuration. The downside of Jest is that it can run significantly slower than Mocha, particularly with large test suites.

When choosing a test runner, a general guideline is
- For speed and configurability, choose Mocha
- For ease-of-use and developer experience, choose Jest

[product]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[producti]: ./js.svg
[eslint]: https://eslint.org/
[es6]: https://exploringjs.com/es6/
[import]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import
[spread]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[babel]: https://babeljs.io/
[webpack]: https://webpack.js.org/
[polyfill]: https://developer.mozilla.org/en-US/docs/Glossary/Polyfill
[typescript]: https://www.typescriptlang.org/
[eslint_config]: https://github.com/sparkbox/eslint-config-sparkbox
[react]: https://reactjs.org/
[vue]: https://vuejs.org/
[redux]: https://redux.js.org/
[axios]: https://github.com/axios/axios
[lodash]: https://lodash.com/
[moment]: https://momentjs.com/
[chartist]: https://gionkunz.github.io/chartist-js/
[isomorphic]: https://en.wikipedia.org/wiki/Isomorphic_JavaScript
[mocha]: https://mochajs.org/
[chai]: https://www.chaijs.com/
[sinon]: https://sinonjs.org/
[jsdom]: [https://github.com/jsdom/jsdom]
[enzyme]: [https://airbnb.io/enzyme/]
[jest]: https://jestjs.io/
[dom]: [https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model]
