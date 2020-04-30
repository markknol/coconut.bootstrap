# Coconut-Bootstrap

> ### Bootstrap for Haxe/Coconut.ui

**Coconut-Bootstrap is a complete re-implementation of the Bootstrap components using `coconut.ui`. It has no dependency on either bootstrap.js or jQuery. If you have `coconut.vdom` setup and `coconut.bootstrap` installed, you have everything you need.**

Methods and events using jQuery is done imperatively by directly manipulating the DOM. In contrast, `coconut.ui` uses updates to the state to update the virtual DOM. In this way, Coconut-Bootstrap provides a more reliable solution by incorporating Bootstrap functionality into Coconut's virtual DOM. 

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

Create _build.hxml_
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

Create _bin/index.html_

```html
<!DOCTYPE>
<html>
<head>
	<meta charset="utf8" />
	<title>Hello coconut.bootstrap</title>
</head>
<body>
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

Create _src/Main.hx_
```haxe
package;

import coconut.data.*;
import coconut.ui.*;
import coconut.Ui.hxx;
import tink.state.*;
import js.Browser.*;

using tink.CoreApi;

class Main {
	static function main() {
		coconut.ui.Renderer.mount(
			cast document.body.appendChild(document.createDivElement()), hxx('<Root />')
		);
	}
}

class Root extends View {
	@:state var items:List<Item> = null;

	function add() {
		items = items.append(new Item({id: window.prompt("name")}));
	}

	function remove(id:String) {
		items = items.filter(function(i) return i.id != id);
	}

	function render() '
		<div>
			<button onclick=${add}>Add item</button>
			<ul>
				<for ${i in items}>
					<li>${i.id} <button onclick=${remove(i.id)}>x</button></li>
				</for>
			</ul>
		</div>
	';
}

class Item implements Model {
	@:constant var id:String;
}
```

### Stylesheets

Because Coconut-Bootstrap doesn't depend on a very precise version of Bootstrap, we don't ship with any included CSS. However, a stylesheet is required to use these components. 

How and which Bootstrap styles you include is up to you, but the simplest way is to include the latest styles from the CDN. A little more information about the benefits of using a CDN can be found in the [Bootstrap introduction](https://getbootstrap.com/docs/4.4/getting-started/introduction/).

### Open Visual Studio Code 

1. File > Open folder > Select your new project folder
1. Build the project: Press CTRL-SHIFT-B > select `build.hxml`
1. Open the project: open `bin/index.html` in your browser, preferably using some webserver.

> You're ready to create cool stuff now

### Importing components

You can import individual components like: `import bootstrap.Button`. If you want all the components, use `import bootstrap.*`.

```html
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"
/>
```

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
 * [x] Pagination
 * [x] Progress

 </td>
 <td valign=top>
 
 * [ ] Figures
 * [ ] Accordion
 * [ ] Carousel
 * [ ] Forms
 * [ ] Input Group
 * [ ] List Group
 * [ ] Modal
 * [ ] Navs
 * [ ] Navbar
 * [ ] Overlays
 * [ ] Popovers
 * [ ] Spinners
 * [ ] Table
 * [ ] Tabs
 * [ ] Tooltips
 * [ ] Toasts

 </td>
 </tr>
 </table>

> **Note:** Because there aren't components doesn't mean you can't use it, for example to create a spinner you can already use `<div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div>`. 

## Browser support

We aim to support all browsers supported by both coconut and Bootstrap.

---

This project is heavily inspired by <https://react-bootstrap.netlify.app/getting-started/introduction/>