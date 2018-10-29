# Pattern Libraries

What do we consider a "[pattern library](https://seesparkbox.com/foundry/building_pattern_libraries_in_react_with_storybook)" to be, exactly? At Sparkbox, our pattern libraries typically consist of all of the "components" that make up a project. We usually combine those components into larger pieces or entire "pages" so that we have some kind of static representation of how the components are used.

Ultimately, what we end up with is a guide for those who are implementing those static components and pages into larger systems, and those who will use our components to build off of in the future.

Keep in mind: you're creating a living tool to give guidance to others. Put into a pattern library what you would hope to get out of a pattern library if you were building new components or pages in a project.

## Tools

### Current tools

We currently use [Downpour](https://github.com/sparkbox/downpour), which is our own implementation of Cloud Four's [Drizzle](https://github.com/cloudfour/drizzle) tool. Downpour and Drizzle are JavaScript-based tools that use [Handlebars](http://handlebarsjs.com/) for templating.

For React-based projects, we've used [React Storybook](https://storybook.js.org/)

### Other tools

- [Fabricator](https://fbrctr.github.io/)
- [Pattern Lab](http://patternlab.io/)

## Naming Conventions

### Naming Overview

When naming a component, first try to think about the places where the component will be used, and if variants of that component will need to be created. If a component is likely to be used in more than one place or in more than one context, you may want to be a bit more generic when naming it.

If you're creating a very generic component — a "button" component, perhaps — you should create a "buttons" directory in your project, and then create a `base` file that will allow you to create variations off of the base component by passing Handlebars literal values into it (ex: `{{agree_button "My Text" class="my-class" visible=true counter=4}}`)

### UI & Other Components

A project's pattern library reflects the vocabulary of both the project itself and the organization. When naming components that reflect the project's UI, you might find it helpful to consult the design comp, and to talk with the rest of your team and even the client.
