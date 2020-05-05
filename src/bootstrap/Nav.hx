package bootstrap;

class Nav extends View {
	public static final prefix = 'nav';

	@:attribute var variant:Variant = null;
	@:attribute var className:ClassName = null;

	@:attribute var type:NavType = Default;
	@:attribute var fill:Bool = false;
	@:attribute var justified:Bool = false;
	@:attribute var vertical:Bool = false;

	@:attribute var asNav:Bool = false;
	
	@:attribute function items(tags:NavTags):Children;

	static var navListTags:NavTags = {
		item: function(attr) '
			<li class=${attr.className.add('$prefix-item')}>
				<a href=${attr.url} class=${[
					'$prefix-link' => true, 
					'disabled' => attr.disabled, 
					'active' => attr.active,
				]} aria-disabled=${attr.disabled}>${...attr.children}</a>
			</li>
		',
	}

	static var navItemTags:NavTags = {
		item: function(attr) '
			<a href=${attr.url} class=${attr.className.add([
				'$prefix-link' => true, 
				'disabled' => attr.disabled, 
				'active' => attr.active,
			])} aria-disabled=${attr.disabled}>${...attr.children}</a>
		',
	}

	function render() '
		<let className=${className.add([
			'$prefix' => true,
			'$prefix-$type' => true,
			'$prefix-fill' => fill,
			'$prefix-justified' => justified,
			'flex-column' => vertical,
		])}>
			<if ${asNav}>
				<nav class=${className} role="navigation">
					${...items(navItemTags)}
				</nav>
			<else>
				<div role="navigation">
					<ul class=${className}>
						${...items(navListTags)}
					</ul>
				</div>
			</if>
		</let>
	';
}

enum abstract NavType(String) to String {
	public static final all:Array<NavType> = [Default, Pills, Tabs];
	var Default = "default";
	var Pills = "pills";
	var Tabs = "tabs";
}

private typedef NavTags = {
	function item(attr:NavItemAttr):RenderResult;
	/*function menu(attr:{ 
		?className:ClassName,
		caption:String,
		?items:(tags:NavTags)->Children,
	}):RenderResult;*/
}

private typedef NavItemAttr = {
	url:String,
	?disabled:Bool,
	?active:Bool,
	?className:ClassName,
	children:Children,
	?listItem:Bool,
}