package bootstrap;

class ButtonGroup extends View {
	@:attribute var children:Children;
	@:attribute var className:ClassName = null;
	@:attribute var ariaLabel:String = null;
	@:attribute var vertical:Bool = false;

	function render() '
		<div role="group" class=${className.add(["btn-group" => true, "btn-group-vertical" => vertical])} aria-label=${ariaLabel}>${...children}</div>
	';
}
