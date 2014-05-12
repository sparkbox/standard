Naming Conventions
=====

We follow [SMACSS](http://smacss.com/) conventions when naming CSS classes.
When you are naming something, **do not** name it based on its content, as this will be difficult to
use the module elsewhere. Try to name modules based on function instead.

**Modules** are the building blocks of a website. Multi-word module names should be *hyphen-separated*:
```css
.module {}
/* or */
.even-grid {}
```

**Subcomponents** are bits and pieces of a module that are specific to that module. A module is separated from a subcomponent with *double--hyphens*:
```css
.module--subcomponent {}
/* or */
.even-grid--item {}
```

**Modifiers** change or add styling in certain cases. They should be separated from what they modify with *underscores*:
```css
.module--subcomponent_modifier {}
/* or */
.even-grid--item_has-image {}
```

**Alternate modules** (a.k.a. subclassed modules) are simply modified modules. That means we use the modifier's *underscore* convention on them:
```css
.module_modifier {}
/* or */
.even-grid_constrained {}
```

So if a subcomponent requires special styling inside of an alternate module, do this:
```css
.module_modifier--subcomponent {}
/* or */
.even-grid_constrained--item { /* add me to an element in addition to .even-grid--item */}
```

**Only be as verbose as you need to be.** Don't allude to DOM structure when you don't need to:
```css
/* don't do */
.even-grid--contents--image {}

/* do */
.even-grid--image {}
```

For more information, please reference [documentation on the SMACSS website](http://smacss.com/).