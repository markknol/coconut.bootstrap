# Bootstrap for Haxe / Coconut.ui

[![Build project](https://github.com/markknol/coconut.bootstrap/workflows/Build%20project/badge.svg)](https://github.com/markknol/coconut.bootstrap/actions)

**Coconut-Bootstrap is a complete re-implementation of the Bootstrap components using `coconut.ui`. It has no dependency on either bootstrap.js or jQuery. If you have `coconut.vdom` setup and `coconut.bootstrap` installed, you have everything you need.**

Methods and events using jQuery is done imperatively by directly manipulating the DOM. In contrast, `coconut.ui` uses updates to the state to update the virtual DOM. In this way, Coconut-Bootstrap provides a more reliable solution by incorporating Bootstrap functionality into Coconut's virtual DOM. 

> [Coconut.ui](https://github.com/MVCoconut/coconut.ui) is the React alternative for [Haxe](https://haxe.org/). It makes creating interactive UIs easy. Design views for each state using encapsulated components, coconut will update and render the right components when the data changed. Completely type-safe, you profit from all the Haxe goodness! Build responsive, mobile-first projects on the web with the world’s most popular front-end component library.

![coconut.bootstrap](https://raw.githubusercontent.com/markknol/coconut.bootstrap/master/bin/social.png)

# Get started

### Prerequisites

* Install Yarn https://yarnpkg.com
* Install VSCode https://code.visualstudio.com/
* Install Haxe support for vscode https://marketplace.visualstudio.com/items?itemName=nadako.vshaxe
* Install lix support for vscode https://marketplace.visualstudio.com/items?itemName=lix.lix

This project uses [lix.pm](https://github.com/lix-pm/lix.client) as Haxe package manager.

### Project setup

Create a new project directory somewhere, open commandline here
```
yarn init
yarn add lix
yarn lix scope create
yarn lix use haxe stable
yarn lix install gh:markknol/coconut.bootstrap
md src
md bin
```

Create _[src/build.hxml](build-example.hxml)_
```hxml
-cp src
-lib coconut.vdom
-lib coconut.bootstrap
-main Main
-dce full
-D analyzer-optimize
-D js_es=6
-js bin/main.js
```

Create _[bin/index.html](bin/example/index.html)_

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf8" />
	<title>🥥 Coconut.ui Bootstrap Example</title>
</head>
<body class="bg-light">
	<link
		rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous"
	/>
 	<script src="main.js"></script>
</body>
</html>
```

Create _[src/Main.hx](test/example/Main.hx)_
```haxe
import js.Browser.document;
import js.Browser.window;
import coconut.vdom.Renderer.hxx;
import coconut.data.Model;
import coconut.ui.View;
import coconut.data.*;
import bootstrap.*;

class Main {
	static function main() {
		coconut.ui.Renderer.mount(
			cast document.body.appendChild(document.createDivElement()), hxx('<Root />')
		);
	}
}

class Root extends View {
	@:state var items:List<Item> = null;

	function add(_) {
		items = items.append(new Item({id: window.prompt("name")}));
	}

	function remove(id:String) {
		items = items.filter((i -> i.id != id);
	}

	function render() '
		<Container>
			<Jumbotron>
				<h1>Hello, world!</h1>
				<p>This is an example of how to use Haxe, Coconut.ui and bootstrap at the same time.</p>
			</Jumbotron>
			<if ${items.length > 0}>
				<p><strong>Total items:</strong> ${items.length}</p>
			<else>
				<p>Start adding items in your list.</p>
			</if>
			<ListGroup className="mb-1">
				<items>
					<for ${i in items}>
						<item>${i.id} <Button onclick=${remove(i.id)} variant=${Light} size=${Small} className="float-right">❌</Button></item>
					</for>
				</items>
			</ListGroup>
			<Button onclick=${add}>Add item</Button>
		</Container>
	';
}

class Item implements Model {
	@:constant var id:String;
}
```

### Open Visual Studio Code 

1. File > Open folder > Select your new project folder
1. Build the project: Press CTRL-SHIFT-B > select `build.hxml`
1. Open the project: open `bin/index.html` in your browser, preferably using some webserver.

> You're ready to create cool stuff now

A live demo of this example can be found here: <https://haxe.stroep.nl/coconut-bootstrap/example/>

### Importing components

You can import individual components like: `import bootstrap.Button`. If you want all the components, use `import bootstrap.*`.

### Stylesheets

Because Coconut-Bootstrap doesn't depend on a very precise version of Bootstrap, we don't ship with any included CSS. However, a stylesheet is required to use these components. 

How and which Bootstrap styles you include is up to you, but the simplest way is to include the latest styles from the CDN. A little more information about the benefits of using a CDN can be found in the [Bootstrap introduction](https://getbootstrap.com/docs/4.4/getting-started/introduction/).


### Make production build

Since we use ES6 output we need to use `terser` instead of `uglify` (from NPM) but we can use the `uglify` library from Haxelib (This library runs the node module after compilation completed).

1. Add dependencies
   ```
   yarn add terser
   yarn lix install haxelib:uglifyjs
   ```
1. Append to your build.hxml:
   ```
   -lib uglifyjs
   -D uglifyjs_overwrite
   -D uglifyjs_bin=node_modules/.bin/terser 
   #-D uglifyjs_disable
   --no-traces
   ```
   if you go back to development, you can remove the hash from `-D uglifyjs_disable`.
1. In vscode, compile again

> Ship it!

Note to JavaScript developers:  

- In Haxe there is no need to bundle sources, this is default compiler behavior. 
- Haxe omits `trace` statements when using `--no-traces`.
- Unused imports / fields / classes have no impact on the final bundle size (due use of [`-dce full`](https://haxe.org/manual/cr-dce.html) and [`-D analyzer-optimize`](https://haxe.org/manual/cr-static-analyzer.html)).

# Status

The project is still under development, but works with the components listed below.

## Components

<table width=100%>
<tr>
	<th>Done</th>
	<th>TODO</th>
<tr>
<td valign=top>

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
 * [x] Jumbotron
 * [x] List Group
 * [x] Pagination
 * [x] Progress
 * [x] Spinners
 * [x] Table

 </td>
 <td valign=top>
 
 * [ ] Figures
 * [ ] Accordion
 * [ ] Carousel
 * [ ] Forms
 * [ ] Input Group
 * [ ] Modal
 * [ ] Navs
 * [ ] Navbar
 * [ ] Overlays
 * [ ] Popovers
 * [ ] Tabs
 * [ ] Tooltips
 * [ ] Toasts

 </td>
 </tr>
 </table>

> **Note:** Because there aren't components doesn't mean you can't use it, for example to create a spinner you can already use `<div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div>`. 

A live demo of all the components can be found here <https://haxe.stroep.nl/coconut-bootstrap/>

## Browser support

We aim to support all browsers supported by both coconut and Bootstrap.

---

This project is heavily inspired by <https://react-bootstrap.netlify.app/getting-started/introduction/>
