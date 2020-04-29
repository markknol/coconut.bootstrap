package bootstrap;

class Breadcrumb extends View {
	static inline final prefix: String = 'breadcrumb';
	
	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	function render() '
		<ol class=${className.add(prefix)}>
			${...children}
		</ol>
	';

	public static function Item(attr:{?href:String, ?active:Bool, ?className:ClassName, children:String}) '
		<li class=${attr.className.add([
			'breadcrumb-item' => true, 
			'active' => attr.active
		])}>
			<if ${attr.href != null && !attr.active}>
				<a href=${attr.href}>${attr.children}</a>
			<else>
				${attr.children}
			</if>
		</li>
	';
}
