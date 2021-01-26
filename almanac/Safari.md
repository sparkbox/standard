# Safari

## Persistent Scrollbar Quirk

On macOS, the default display is to only display a scrollbar during the action of scrolling. The user can alternatively enable the scrollbar to always be visible. With this option enabled, the value of [`window.innerWidth`](https://developer.mozilla.org/en-US/docs/Web/API/Window/innerWidth) does not equal the same as a CSS media query. The difference will be about 15 pixels, which is the width of the scrollbar on Safari. This can cause a perceived misfiring of events that should occur at a specific screen size in both the JS and CSS.

The remedy to this problem is to instead use [`document.body.clientWidth`](https://developer.mozilla.org/en-US/docs/Web/API/Element/clientWidth) to capture the document width, which will get the width without the added scrollbar width.
