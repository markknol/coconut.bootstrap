package bootstrap;

class CloseButton extends View {
	@:attribute function onclick():Void;
	@:attribute var label:String = "Close";

	function render() '
		<button
			type="button"
			className="close"
			onclick=${onclick}
		>
			<span aria-hidden="true">&times;</span>
			<span className="sr-only">${label}</span>
		</button>
	';
}