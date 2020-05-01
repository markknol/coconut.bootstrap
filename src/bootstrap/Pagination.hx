package bootstrap;

class Pagination extends View {
	public static final prefix = 'page';

	@:attribute var className:ClassName = null;
	@:attribute var size:Size = null;

	@:attribute function items(tags:PaginationTags):Children;

	static var tags:PaginationTags = {
		item: function(attr) '
			<item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled} active=${attr.active}>${...attr.children}</item>
		',
		first: function(attr) '
			<item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>«</item>
		',
		prev: function(attr) '
			<item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>‹</item>
		',
		next: function(attr) '
			<item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>›</item>
		',
		last: function(attr) '
			<item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>»</item>
		',
		ellipsis: function(attr) '
			<item disabled href=${attr.href}>…</item>
		',
	}

	function render() '
		<ul class=${className.add(['pagination' => true, 'pagination-$size' => size != null])}>
			${...items(tags)}
		</ul>
	';

	static function item(attr:PaginationItemAttr) '
		<li class=${attr.className.add(['$prefix-item' => true, 'active' => attr.active, 'disabled' => attr.disabled])}>
			<if ${!attr.disabled || attr.href == null}>
				<a href=${attr.href} onclick=${attr.onclick} role="button" class=${'$prefix-link'}>
					${...attr.children}
				</a>
			<else>
				<span aria-hidden=${attr.disabled} class=${'$prefix-link'}>
					${...attr.children}
				</span>
			</if>
		</li>
	';
}

private typedef PaginationTags = {
	function item(attr:PaginationItemAttr):RenderResult;
	function first(attr:PaginationNavItemAttr):RenderResult;
	function prev(attr:PaginationNavItemAttr):RenderResult;
	function next(attr:PaginationNavItemAttr):RenderResult;
	function last(attr:PaginationNavItemAttr):RenderResult;
	function ellipsis(attr:PaginationEllipsisAttr):RenderResult;
}

private typedef PaginationNavItemAttr = {?href:String, ?onclick:()->Void, ?disabled:Bool, ?className:ClassName}
private typedef PaginationItemAttr = PaginationNavItemAttr & { children:Children, ?active:Bool }
private typedef PaginationEllipsisAttr = {?href:String, ?className:ClassName}