package bootstrap;

class Breadcrumb extends View {
	static inline final prefix: String = 'breadcrumb';
	
	@:attribute var className:ClassName = null;
	
	@:attribute function items(tags:BreadcrumbTags):Children;

	function render() '
		<ol class=${className.add(prefix)}>
			${...items(tags)}
		</ol>
	';

	static var tags:BreadcrumbTags = {
		item: function (attr) '
			<li class=${attr.className.add([
				'$prefix-item' => true, 
				'active' => attr.active
			])}>
				<if ${attr.href != null && !attr.active}>
					<a href=${attr.href}>${attr.children}</a>
				<else>
					${attr.children}
				</if>
			</li>
		',
	}
}

typedef BreadcrumbTags = {
	function item(attr:BreadcrumbItemAttr):RenderResult;
}

typedef BreadcrumbItemAttr = {?href:String, ?active:Bool, ?className:ClassName, children:String}