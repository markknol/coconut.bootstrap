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
		items = items.filter(i -> i.id != id);
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
