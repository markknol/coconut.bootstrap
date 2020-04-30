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
		items = items.filter(function(i) return i.id != id);
	}

	function render() '
		<Container>
			<Jumbotron>
				<h1>Hello, world!</h1>
				<p>This is an example of how to use Haxe, Coconut.ui and bootstrap at the same time.</p>
			</Jumbotron>
			<ul class="list-group my-3">
				<for ${i in items}>
					<li class="list-group-item">${i.id} <Button onclick=${remove(i.id)} variant=${Secondary}>x</Button></li>
				</for>
			</ul>
			<Button onclick=${add}>Add item</Button>
		</Container>
	';
}

class Item implements Model {
	@:constant var id:String;
}
