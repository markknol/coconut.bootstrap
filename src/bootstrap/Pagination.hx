package bootstrap;

class Pagination extends View {
	public static final prefix = 'page';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;
	@:attribute var size:Size = null;

	function render() '
		<ul class=${className.add(['pagination' => true, 'pagination-$size' => size != null])}>
			${...children}
		</ul>
	';

	public static function Item(attr:{?href:String, ?onclick:()->Void, ?active:Bool, ?disabled:Bool, ?className:ClassName, children:Children}) '
		<li class=${attr.className.add(['$prefix-item' => true, 'active' => attr.active, 'disabled' => attr.disabled])}>
			<if ${!attr.disabled}>
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

	public static function Ellipsis(attr:{?href:String, ?className:ClassName}) '
		<Pagination.Item disabled href=${attr.href}>…</Pagination.Item>
	';

	public static function First(attr:{?href:String, ?onclick:()->Void, ?disabled:Bool, ?className:ClassName}) '
		<Pagination.Item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>«</Pagination.Item>
	';

	public static function Prev(attr:{?href:String, ?onclick:()->Void, ?disabled:Bool, ?className:ClassName}) '
		<Pagination.Item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>‹</Pagination.Item>
	';

	public static function Next(attr:{?href:String, ?onclick:()->Void, ?disabled:Bool, ?className:ClassName}) '
		<Pagination.Item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>›</Pagination.Item>
	';

	public static function Last(attr:{?href:String, ?onclick:()->Void, ?disabled:Bool, ?className:ClassName}) '
		<Pagination.Item href=${attr.href} onclick=${attr.onclick} disabled=${attr.disabled}>»</Pagination.Item>
	';
}
