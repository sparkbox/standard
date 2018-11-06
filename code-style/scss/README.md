# SCSS

**Table of Contents**

1. [Introduction](#Introduction)
1. [Class Naming Theory](#Class-Naming-Theory)
1. [BEM](#BEM)
  2. [Using BEM](#Using-BEM)
    3. [Block](#Block)
    4. [Element](#Element)
    5. [Modifier](#Modifier)
  3. [BEM in Sass](#BEM-in-Sass)
4. [ITCSS](#ITCSS)
  5. [File Naming](#File-Naming)
    6. [Settings](#Settings)
    7. [Tools](#Tools)
    8. [Generic](#Generic)
    9. [Elements](#Elements)
    10. [Objects](#Objects)
    11. [Components](#Components)
    12. [Utilities](#Utilities)
13. [ITCSS and BEM](#ITCSS-and-BEM)
2. [Name Spacing](#Name-Spacing)


## Introduction

Our CSS is organized using [Harry Roberts](csswizardry.com)' Inverted Triangle CSS (ITCSS) organizational approach. This method is mixed with [Block Element Modifier](http://getbem.com) (BEM) naming convention for class names throughout the stylesheet.

---

## Class Naming Theory

When it comes to naming classes, we find it best to be as specific as possible with the fewest words possible. This can be an exercise in understanding the purpose and function of a component. It's helpful to find like components and think about what they have in common and what their purpose is. You can then choose a generic name that encapsulates the uses the component will have.

Keep in mind that naming is for humans, so verboseness is useful if it helps communicate what the class does. Ideally, a future developer should be able to look at a class name and have a reasonable idea of what they might see on the rendered page.

---

## BEM

BEM stands for block element modifier, which is the order you follow for naming with BEM.

#### Block

`.block` is the parent wrapper of the component. This would be something like site navigation, the hero section, or a footer. Any container that holds other code could be a block.

#### Element

`.block__element` is an element inside the component, or inside the parent wrapper. This could be a title or a link. It's anything inside the parent wrapper. It's important here to note that BEM isn't meant to reflect nesting. For example, say you have a section that includes an image element inside an anchor element:

```html
<section>
  <a href="#">
    <img src="#">
  </a>
</section>
```

Our BEM naming doesn't need to show that we nested that image tag, so we would give it a class name of something like `.block__image`. We would _not_ give it a class name of `.block__link__image`.

#### Modifier

Modifiers are the most specific of the three parts of BEM. They should only define one or two properties that change the previously defined properties on the block or element. You can use a modifier on a block or an element.

`.block--modifier` modifies the entire component.

`.block__element--modifier` modifies a single element inside a component.

#### Example
Let's look at an example. Maybe we have a hero section that's reused on each page of a site. The block might be called `.hero`, because that's what the entire section is. The title, description, and button are all elements, so they would be `.hero__title`, `.hero__description`, and `.hero__button`. We don't need any modifiers yet, because a modifier is really specific.

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button"></p>
</section>
```

Now, what if on one page where we want a dark version of our button? We can create a modifier class for the `background-color` property so that we're only changing the color of the button with that modifier class. Notice that you still need to include the original `.hero__button` element level class. That's because the modifier is only changing the `background-color`, and you still want all the other properties from the original button class.

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button hero__button--dark"></p>
</section>
```

### BEM in Sass

The formatting of BEM relies on Sass local variables to ease the amount of repetitiveness inherent with BEM. Using the same structure above looks like this in the SCSS file:

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

Let's use our example from above to see what our Sass would look like:

<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button hero__button--dark"></p>
</section>

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

ITCSS stands for Inverted Triangle CSS. It separates CSS into sections to help developers manage CSS specificity and the cascade. There are seven layers of the inverted triangle. The idea is that you start with a wide reach and low specificty at the top, and as you go down, the reach narrows and the properties get more specific. This helps you avoid specifity issues.

#### Settings

When using a preprocessor, settings are used to define variables. This puts variables at the top of the cascade so they are accessible to all partials further down. No CSS selectors should be generated by the preprocessor from partials in this section.

When not using a preprocessor, the settings area is a good place to write comments describing the colors and font stacks as a guide. If using features such as custom properties, those that are global custom properties should be described in this section.

#### Tools

This section is specifically for preprocessor global mixins and functions. No CSS should be generated by the preprocessor from partials in this section. Some of our favorite global mixins to use are [unbuttonize](https://gist.github.com/zastrow/bb43d2b256d52738e0ffdee7f825e79f) to remove default button styles and [delist](https://gist.github.com/zastrow/94d97dfe2e7e2808bcf4dc45268e6338) to remove default list styles from `<ol>` and `<ul>`.

#### Generic

Here we define any generic styles that are not specific to the styles of the site. This section should include any Reset or Normalize libraries and any preferential base styles for elements. There shouldn’t be any classes or ids used in this section.

#### Elements

This is where we define styling for bare HTML elements (like H1, A, etc.). These elements come with default styling from the browser, so we can redefine them here.

#### Objects

Objects are class-based selectors that define undecorated design patterns, for example [the media object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/) (a pattern with an image on the left and descriptive content on the right, like a Tweet for example) from OOCSS.

#### Components

This section is where we define our specific UI components. This is where the majority of our work takes place, and our UI components are often composed of Objects and Components.

#### Utilities

Utilities are helper classes with the ability to override anything that goes before it in the triangle. Utility classes are very specific. Sometimes we use utility classes to set up spacing systems, which would consist of creating classes for certain sizes of padding or margin to be used anywhere on the site, or to establish a hide helper class that our JavaScript can interact with to toggle the visibility of elements.

---

## Namespacing

We namespace to articulate what class names we wrote. As with the [class naming section above](#Class-Naming-Theory), namespacing is a useful tool to describe what kind of class this is and how it functions. Also, like class naming, the more information in the namespace, the easier it is to comprehend for future developers.

A namespace title should consist of more than one character but no more than four characters. One character rarely provides enough information to describe the type of class, and more than four characters causes the namespace to compete with the class name. Namespaces should be quick to comprehend, but only act as an aid to define the type of styles that will exist and how they function.

Our namespacing is derived from the ITCSS section the class belongs in. Since settings, tools, generic, and elements are only used in file naming (and usually use the whole title in the file name), we have only defined ITCSS prefixes for the sections used for class naming:

- `.obj-` (objects)
- `.cmp-` (components)
- `.util-` (utilities)

It's important to note that these prefixes are only used in _class_ naming. Sometimes we want to prefix a _file_ name with the ITCSS section to communicate what the file includes, and in that case we would use the entire name of the section.

---

## How ITCSS works with BEM

We use ITCSS and BEM together to help us communicate the purpose of a class. ITCSS shows up both in file naming and in class naming, while BEM is only used for class naming.

### ITCSS File Naming

The parts of ITCSS that are used for file naming don't use BEM. An example of this might be color variables. Those belong in the settings section of the inverted triangle, so we would create a file for that called `settings.variables.color.scss` in which we might define some colors:

```scss
$c-sky-blue: //value for blue
$c-crimson: //value for red
```

We don't need BEM for this because we're not defining classes.

### ITCSS and BEM Class Naming

Objects, components, and utilities are the parts of ITCSS that are used in class naming, and they work together with BEM. Let's look at our example from the [BEM](#BEM) section again:

```html
<section class="hero">
  <h1 class="hero__title"></h1>
  <p class="hero__description"></p>
  <button class="hero__button hero__button--dark"></p>
</section>
```

Right now, we're only using BEM here, but we can add ITCSS to better communicate to other developers what this piece of code is (a component), and what it's for (defining classes for the hero block). This example is a hero section, which is a specific part of our site's UI. That means it's a component in ITCSS. For components, we prefix class names with `.cmp`:

```html
<section class="cmp-hero">
  <h1 class="cmp-hero__title"></h1>
  <p class="cmp-hero__description"></p>
  <button class="cmp-hero__button cmp-hero__button--dark"></p>
</section>
```

Maybe we want this component to have some layout styles, like centering it on the page and giving it a max-width. That would require a layout class, which is on the object level of ITCSS. To do this, we can create a stylesheet file called `objects.layout.scss` (remembering that we use the full name of the ITCSS section in file naming, and the prefix of the ITCSS section in class naming) and include something like:

```scss
.obj-layout {
  max-width: 75rem;
  margin: 0 auto;
}
```

Then, we'll apply our new class to our hero section:

```html
<section class="obj-layout cmp-hero">
  <h1 class="cmp-hero__title"></h1>
  <p class="cmp-hero__description"></p>
  <button class="cmp-hero__button cmp-hero__button--dark"></p>
</section>
```

Future developers will be able to learn a lot about this piece of code by the class names we've used. The more we can communicate in the code, the easier it will be for current and future developers to understand and work with the same code.