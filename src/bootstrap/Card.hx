package bootstrap;

class Card extends View {
	static inline final prefix: String = 'card';
	@:attribute var width:EitherType<String, Float> = null;

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	function render() '
		<div class=${className.add('$prefix')} style="width: ${(width != null ? '${width}' : null)};">
			${...children}
		</div>
	';

	public static function header(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-header'), attr.children);
	}
	
	public static function footer(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-footer'), attr.children);
	}

	public static function text(attr:{?className:ClassName, children:Children}) '
		<p class=${attr.className.add('$prefix-text')}>${...attr.children}</p>
	';

	public static function body(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-body'), attr.children);
	}

	public static function title(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-title').add('h5'), attr.children);
	}

	public static function subtitle(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-subtitle').add('h6'), attr.children);
	}

	public static function link(attr:{href:String, ?className:ClassName, children:Children}) '
		<a href=${attr.href} class=${attr.className.add('$prefix-link')}>${...attr.children}</a>
	';
}
