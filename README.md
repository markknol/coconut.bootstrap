# Coconut-Bootstrap

> ### Bootstrap for Haxe/Coconut.ui

**Coconut-Bootstrap is a complete re-implementation of the Bootstrap components using `coconut.ui`. It has no dependency on either bootstrap.js or jQuery. If you have `coconut.vdom` setup and `coconut.bootstrap` installed, you have everything you need.**

Methods and events using jQuery is done imperatively by directly manipulating the DOM. In contrast, `coconut.ui` uses updates to the state to update the virtual DOM. In this way, Coconut-Bootstrap provides a more reliable solution by incorporating Bootstrap functionality into Coconut's virtual DOM. 

![coconut.bootstrap](https://raw.githubusercontent.com/markknol/coconut.bootstrap/master/bin/social.png)

### Dependencies

 * [Haxe](https://haxe.org/)
 * [Node.js](https://nodejs.org/)

This project uses [lix.pm](https://github.com/lix-pm/lix.client) as Haxe package manager.

### Installation

To create a new `coconut.vdom` project, use this guide <https://gist.github.com/markknol/0de2d8d05e8f3d725946eb5515cc771b>.

To add Coconut-Bootstrap to your project, run:

```
yarn lix install gh:markknol/coconut.bootstrap
```

## Components

 * [x] Container
 * [x] Row
 * [x] Col
 * [x] Alert
 * [x] Badge / Pill
 * [x] Breadcrumb
 * [x] Buttons
 * [x] Button Group
 * [x] Card
 * [x] Dropdown
 * [x] Image
 * [ ] Figures
 * [ ] Accordion
 * [ ] Carousel
 * [ ] Forms
 * [ ] Input Group
 * [x] Jumbotron
 * [ ] List Group
 * [ ] Modal
 * [ ] Navs
 * [ ] Navbar
 * [ ] Overlays
 * [x] Pagination
 * [ ] Popovers
 * [x] Progress
 * [ ] Spinners
 * [ ] Table
 * [ ] Tabs
 * [ ] Tooltips
 * [ ] Toasts

> **Note:** Because there aren't components doesn't mean you can't use it, for example to use a spinner you can do `<div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div>`. 

### Importing components

You can import individual components like: `import bootstrap.Button`. If you want all the components, use `import bootstrap.*` this has no impact on the final bundle size, since Haxe eliminates unused classes / fields.

### Stylesheets

Because Coconut-Bootstrap doesn't depend on a very precise version of Bootstrap, we don't ship with any included CSS. However, a stylesheet is required to use these components. 

How and which Bootstrap styles you include is up to you, but the simplest way is to include the latest styles from the CDN. A little more information about the benefits of using a CDN can be found in the [Bootstrap introduction](https://getbootstrap.com/docs/4.4/getting-started/introduction/).

```html
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"
/>
```

## Browser support

We aim to support all browsers supported by both coconut and Bootstrap.

---

This project is heavily inspired by <https://react-bootstrap.netlify.app/getting-started/introduction/>