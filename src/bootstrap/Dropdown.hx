package bootstrap;

class Dropdown extends View {
	public static final prefix = 'dropdown';

	@:attribute var variant:Variant = null;
	@:attribute var caption:String;
	@:attribute var className:ClassName = null;

	@:attribute function menu(tags:MenuTags):Children;

	@:controlled var open:Bool = false;

	static var tags:MenuTags = {
		link: function(attr) '
			<a href=${attr.url} class=${attr.className.add('$prefix-item')}>${...attr.children}</a>
		',
		divider: function(attr) '
			<div class="$prefix-divider"></div>
		'
	}

	function render() '
		<div class=${className.add(prefix)}>
			<Button variant=${variant} class="$prefix-toggle" onclick=$handleClick>${caption}</Button>
			<div class=${['$prefix-menu' => true, 'show' => open]}>
				${...menu(tags)}
			</div>
		</div>
	';

	function handleClick(e) if (!open) {
		open = true;
		e.stopPropagation();
		var body = js.Browser.document.body;
		body.addEventListener('click', function close() {
			open = false;
			body.removeEventListener('click', close);
		});
	}
}

private typedef MenuTags = {
	function link(attr:LinkAttr):RenderResult;
	function divider(attr:{}):RenderResult;
}

private typedef LinkAttr = {
	url:String,
	?className:ClassName,
	children:Children
}
