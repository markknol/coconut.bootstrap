package bootstrap;

class ButtonToolbar extends View {
	@:attribute var children:Children;
	@:attribute var className:ClassName = null;
	@:attribute var ariaLabel:String = null;
	
	function render() '
		<div role="toolbar" class=${className.add("button-toolbar")} aria-label=${ariaLabel}>${...children}</div>
	';
}