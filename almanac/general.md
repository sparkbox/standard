# General issues

## Interplay between position fixed with transformed ancestors

By default `position: fixed` elements are positioned relative to the viewport which is useful for creating "visually hidden" classes. However if a parent of a `position: fixed` element has a `transform` then that ancestor is the new context. The [spec][spec] states it this way:

> When an ancestor has the transform property set to something different than none then this ancestor is used as container instead of the viewport

### Test case

<p data-height="373" data-theme-id="0" data-slug-hash="gLZmRq" data-default-tab="css,result" data-user="asimpson" data-embed-version="2" data-pen-title="gLZmRq" class="codepen">See the Pen <a href="http://codepen.io/asimpson/pen/gLZmRq/">gLZmRq</a> by Adam Simpson (<a href="http://codepen.io/asimpson">@asimpson</a>) on <a href="http://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

[spec]: https://developer.mozilla.org/en-US/docs/Web/CSS/position
