# SCSS

**Table of Contents**

1. [Introduction](#Introduction)
2. [Class Naming Theory](#Class-Naming-Theory)
3. [BEM](#BEM)
   1. [Using BEM](#Using-BEM)
      1. [Block](#Block)
      2. [Element](#Element)
      3. [Modifier](#Modifier)
   2. [BEM in Sass](#BEM-in-Sass)
4. [ITCSS](#ITCSS)
   1. [File Naming](#File-Naming)
     1. [Settings](#Settings)
     2. [Tools](#Tools)
     3. [Generic](#Generic)
     4. [Elements](#Elements)
     5. [Objects](#Objects)
     6. [Components](#Components)
     7. [Utilities](#Utilities)
5. [Name Spacing](#Name-Spacing)
6. [ITCSS and BEM](#ITCSS-and-BEM)


## Introduction

Our CSS is organized using [Harry Roberts](csswizardry.com)' Inverted Triangle CSS (ITCSS) organizational approach. This method is mixed with [Block Element Modifier](http://getbem.com) (BEM) naming convention for class names throughout the stylesheet.

---

## Class Naming Theory

When it comes to naming classes, we find it best to be as specific as possible with the fewest words possible. This can be an exercise in understanding the purpose and function of a component. It's helpful to find like components and think about what they have in common and what their purpose is. You can then choose a generic name that encapsulates the uses the component will have.

Keep in mind that naming is for humans, so verboseness is useful if it helps communicate what the class does. Ideally, a future developer should be able to look at a class name and have a reasonable idea of what they might see on the rendered page.

---

## BEM

BEM stands for “Block Element Modifier”, which is the order you follow for naming with BEM. We use BEM to name our CSS classes.

#### Block

`.block` is the primary, or parent, component. We start our BEM class names with the name of the Block. An example of a Block might be a site's navigation, hero section, or footer. Any container that holds other code could be a Block.

#### Element

`.block__element` is an Element inside a Block, or inside the parent component. We use two underscorces between the Block and Element to denote that the Element is a child, or descendent, of the Block. An Element could be a title or a link. It's anything inside the parent Block. It's important here to note that BEM isn't meant to reflect nesting. For example, say you have a section that includes an image tag inside an anchor tag:

```html
<section>
  <a href="#">
    <img src="#">
  </a>
</section>
```

Our BEM naming doesn't need to show that we nested that image tag, so we would give it a class name of something like `.block__image`. We would _not_ give it a class name of `.block__link__image`.

#### Modifier

Modifiers are the most specific of the three parts of BEM. They should only define one or two properties that change the previously defined properties on the Block or Element. Since Modifiers only change one or two properties, they have to live alongside the unmodified version of the class name. That way, you still get all the properties you already defined in the original Block or Element level class (we have an example of this below). You can use a Modifier on a Block or an Element.

`.block--modifier` modifies the entire Block.

`.block__element--modifier` modifies a single Element inside a Block.

#### Example
Let's look at an example. Let's say we have a hero section that's reused on each page of a site. The Block might be called `.hero`, because that's what the entire parent section is. The title, description, and button are all Elements, so they would be `.hero__title`, `.hero__description`, and `.hero__button`. We don't need any Modifiers here, because we have nothing to modify yet.

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button"></p>
</section>
```

Now, what if on one page we want a dark version of our button? We can create a Modifier class for the `background-color` property so that we're only changing the color of the button that has that Modifier class applied to it. Notice that you still need to include the original `.hero__button` Element level class. That's because the Modifier is only changing the `background-color`, and you still want all the other properties from the original button class.

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button hero__button--dark"></p>
</section>
```

### BEM in Sass

In combination with Sass local variables and nesting, BEM is an efficient and communicative way to write CSS class names. This is a rough idea of what BEM looks like in a SCSS file:

```scss
.block {
  // styles for .block

  &__element {
    // styles for .block__element

    &--modifier {
      // styles for .block__element--modifier
    }
  }

  &--modifier {
    // styles for .block--modifier
  }
}
```

Let's use our example from above to see what our SCSS file would look like:

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button hero__button--dark"></p>
</section>
```

```scss
.hero {
  // styles for .block

  &__title {
    // styles for .block__element
  }

  &__description {
    // styles for .block__element
  }

  &__button {
    // styles for .block__element

    &--dark {
      // styles for .block__element--modifier
    }
  }
}
```

---

## ITCSS

ITCSS stands for Inverted Triangle CSS. It separates CSS into sections to help developers manage CSS specificity and the cascade. There are seven layers of the inverted triangle, though not every project will need all seven. The idea is that you start with a wide reach and low specificity at the top, and as you go down, the reach narrows and the properties get more specific. This helps you avoid specificity issues.

#### Settings

When using a preprocessor, settings are used to define variables. This puts variables at the top of the cascade so they are accessible to all partials further down. No CSS selectors should be generated by the preprocessor from partials in this section.

When not using a preprocessor, the settings area is a good place to write comments describing the colors and font stacks as a guide. If using features such as custom properties, those that are global custom properties should be described in this section.

#### Tools

This section is specifically for preprocessor global mixins and functions. No CSS should be generated by the preprocessor from partials in this section. Some of our favorite global mixins to use are [unbuttonize](https://gist.github.com/zastrow/bb43d2b256d52738e0ffdee7f825e79f) to remove default button styles and [delist](https://gist.github.com/zastrow/94d97dfe2e7e2808bcf4dc45268e6338) to remove default list styles from `<ol>` and `<ul>`.

#### Generic

Here we define any generic styles that are not specific to the styles of the site. This section should include any Reset or Normalize libraries and any preferential base styles for elements. There shouldn’t be any classes or ids used in this section.

#### Elements

This is where we define styling for bare HTML elements (`h1`, `a`, etc.). These elements come with default styling from the browser, so we can redefine them here.

#### Objects

Objects are class-based selectors that define undecorated design patterns like layout or spacing pattens. An example of an undecorated design pattern would be [the media object pattern](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/) (a pattern with an image on the left and descriptive content on the right, like a Tweet for example) from OOCSS.

#### Components

This section is where we define our specific UI components. This is where the majority of our work takes place, and our UI components are often composed of Objects and Components. A component could be a button, or a textarea, or even a hero section.

#### Utilities

Utilities, sometimes called trumps, are helper classes with the ability to override anything that goes before it in the triangle. Since these classes have an overriding nature, we use a prefix of `.util` on the class name to help communicate their purpose in larger projects (see more about this in our [Namespacing](#Namespacing) section). Utility classes are very specific. Sometimes we use utility classes to set up spacing systems, which would consist of creating classes for certain sizes of padding or margin to be used anywhere on the site, or to establish a hide helper class that our JavaScript can interact with to toggle the visibility of elements.

---

## Namespacing

As with the [class naming section above](#Class-Naming-Theory), namespacing is a useful tool to describe the kind of class it is and how it functions. Also like class naming, the more information in the namespace, the easier it is to comprehend for future developers. In cases where you're working on existing code, it's important to know the difference between what your team wrote and what already existed in the codebase. Namespaces are an important communication tool to identify the classes that your team is creating and working on.

A namespace title should consist of more than one character but no more than four characters. One character rarely provides enough information to describe the type of class, and more than four characters cause the namespace to compete with the class name. For example, a class name prefix of `.c-` could mean component, or color, or anything else. Including just two more characters `.cmp-` makes it much easier to understand that we're looking at the class for a component. Namespaces should be quick to comprehend, and act as an aid to define the type of styles that will exist and how they function.

Our namespacing is derived from the ITCSS section the class belongs in. Since settings, tools, generic, and elements are only used in file naming (and usually use the whole title in the file name), we have only defined ITCSS prefixes for the sections used for class naming:

- `.obj-` (objects)
- `.cmp-` (components)
- `.util-` (utilities)

It's important to note that these prefixes are only used in _class_ naming. Sometimes we want to prefix a _file_ name with the ITCSS section to communicate what the file includes, and in that case, we would use the entire name of the section.


---

## How ITCSS works with BEM

We often use ITCSS and BEM together to help us communicate the purpose of a class. ITCSS shows up both in file naming and in class naming, while BEM is only used for class naming.

### ITCSS File Naming

The parts of ITCSS that are used for file naming don't use BEM. An example of this might be color variables. Those belong in the settings section of the inverted triangle, so we would create a file for that called `_settings.variables.color.scss` in which we might define some colors:

```scss
$color-sky-blue: //value for blue
$color-crimson: //value for red
```

Since these are variable names, we don't have to use BEM here. It's important to use BEM for class names, but it's optional to use in naming your variables.

### ITCSS and BEM Class Naming

Objects, components, and utilities are the parts of ITCSS that are used in class naming, and they work together with BEM. Let's look at our example from the [BEM](#BEM) section again:

```html
<section class="hero">
  <h1 class="hero__title">...</h1>
  <p class="hero__description">...</p>
  <button class="hero__button hero__button--dark">...</button>
</section>
```

Right now, we're only using BEM here, but we can add ITCSS to better communicate to other developers what this piece of code is (a component), and what it's for (defining classes for the hero Block). When you're working on an existing codebase, ITCSS also helps to communicate to other developers that this is _our_ code, and not code that already existed in the codebase. This example is a hero section, which is a specific part of our site's UI. That means it's a component in ITCSS. For components, we use `cmp-` to prefix class names and denote their purpose.

```html
<section class="cmp-hero">
  <h1 class="cmp-hero__title">...</h1>
  <p class="cmp-hero__description">...</p>
  <button class="cmp-hero__button cmp-hero__button--dark">...</button>
</section>
```

Maybe we want this component to have some layout styles, like centering it on the page and giving it a max-width. That would require a layout class, which is on the object level of ITCSS. To do this, we can create a stylesheet file called `objects.layout.scss` (remembering that we use the full name of the ITCSS section in file naming and the prefix of the ITCSS section in class naming) and include something like:

```scss
.obj-layout {
  max-width: 75rem;
  margin: 0 auto;
}
```

Then, we'll apply our new class to our hero section.

```html
<div class="obj-layout">
  <section class="cmp-hero">
    <h1 class="cmp-hero__title">...</h1>
    <p class="cmp-hero__description">...</p>
    <button class="cmp-hero__button cmp-hero__button--dark">...</button>
  </section>
</div>
```
Notice that the `obj-layout` class is applied to its own container. Class names should not mix for component and object elements. The only instance a component or object element has more than one class should be in the cases of modifier or when using utility classes.

Future developers will be able to learn a lot about this piece of code by the class names we've used. The more we can communicate in the code, the easier it will be for current and future developers to understand and work with the same code.


## Additional Resources

- [ITCSS: Scalable and Maintainable CSS Architecture](https://www.xfive.co/blog/itcss-scalable-maintainable-css-architecture/)
- [BEM Website](http://getbem.com)
- [BEM by Example](https://seesparkbox.com/foundry/bem_by_example)
- [Thoughtful CSS Architecture](https://seesparkbox.com/foundry/thoughtful_css_architecture)
