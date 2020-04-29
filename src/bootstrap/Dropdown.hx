package bootstrap;

class Dropdown extends View {
	public static final prefix = 'dropdown';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;
	
	function render() '
		<div class=${className.add(prefix)}>${...children}</div>
	';
	
	public static function Menu(attr:{?className:ClassName, id:String, children:Children}) '
		<div aria-label="test" id=${attr.id} class=${attr.className.add('$prefix-menu')}>${...attr.children}</div>
	';
	
	public static function Toggle(attr:{?variant: Variant, id:String, ?className:ClassName, children:String}) '
		<Button variant=${attr.variant} className=${attr.className.add('$prefix-toggle')}>${attr.children}</Button>
	';
	
	public static function Item(attr:{href:String, ?className:ClassName, children:Children}) '
		<a href=${attr.href} class=${attr.className.add('$prefix-item')}>${...attr.children}</a>
	';
}
/*
<div class="dropdown">
	<button aria-haspopup="true" aria-expanded="false" id="dropdown-basic" type="button" class="dropdown-toggle btn btn-success">Dropdown Button</button>
	<div x-placement="bottom-start" aria-labelledby="dropdown-basic" class="dropdown-menu" style="position: absolute; top: 0px; left: 0px; opacity: 0; pointer-events: none;">
		<a href="#/action-1" class="dropdown-item">Action</a>
		<a href="#/action-2" class="dropdown-item">Another action</a>
		<a href="#/action-3" class="dropdown-item">Something else</a>
	</div>
</div>
*/