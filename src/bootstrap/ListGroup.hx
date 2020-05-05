package bootstrap;

class ListGroup extends View {
	static inline final prefix:String = 'list-group';

	@:attribute var className:ClassName = null;
	@:attribute var flush:Bool = false;
	@:attribute var horizontal:Bool = false; // TODO: use Size

	@:optional @:attribute function items(tags:ListGroupItemTags):Children;

	@:optional @:attribute function links(tags:ListGroupLinkTags):Children;

	@:optional @:attribute function buttons(tags:ListGroupButtonTags):Children;

	function render() '<>
		<let className=${className.add(['$prefix' => true, '$prefix-horizontal' => horizontal, 'flush' => flush])}>
			<if ${items != null}>
				<ul class=${className}>
					${...items(itemTags)}
				</ul>
			</if>
			<if ${links != null}>
				<div class=${className}>
					${...links(linkTags)}
				</div>
			</if>
			<if ${buttons != null}>
				<div class=${className}>
					${...buttons(buttonTags)}
				</div>
			</if>
		</let>
	</>';

	static var itemTags:ListGroupItemTags = {
		item: function(attr) '
			<li class=${attr.className.add([
				'$prefix-item' => true,
				'$prefix-item-${attr.variant}' => attr.variant != null,
				'active' => attr.active,
				'disabled' => attr.disabled,
			])}>
				${...attr.children}
			</li>
		'
	}

	static var linkTags:ListGroupLinkTags = {
		item: function(attr) '
			<a class=${attr.className.add([
				'$prefix-item' => true,
				'$prefix-item-action' => true,
				'$prefix-item-${attr.variant}' => attr.variant != null,
				'active' => attr.active,
				'disabled' => attr.disabled,
			])}
				href=${attr.href}>
					${...attr.children}
			</a>
		'
	}

	static var buttonTags:ListGroupButtonTags = {
		item: function(attr) '
			<button class=${attr.className.add([
				'$prefix-item' => true,
				'$prefix-item-action' => true,
				'$prefix-item-${attr.variant}' => attr.variant != null,
				'active' => attr.active,
			])}
			type="button"
			disabled=${attr.disabled}
			onclick=${attr.onclick}>
				${...attr.children}
			</button>
		',
	}
}

typedef ListGroupItemTags = {
	function item(attr:ListGroupItemAttr):RenderResult;
}

typedef ListGroupLinkTags = {
	function item(attr:ListGroupItemAttr & {href:String}):RenderResult;
}

typedef ListGroupButtonTags = {
	function item(attr:ListGroupItemAttr & {?onclick:() -> Void}):RenderResult;
}

typedef ListGroupItemAttr = {?active:Bool, ?disabled:Bool, ?className:ClassName, ?variant:Variant, children:Children}
