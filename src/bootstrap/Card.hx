package bootstrap;

class Card extends View {
	static inline final prefix: String = 'card';
	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	function render() return Bootstrap.create(className.add(prefix), children);

	public static function Header(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-header'), attr.children);
	}
	
	public static function Footer(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-footer'), attr.children);
	}

	public static function Text(attr:{?className:ClassName, children:Children}) '
		<p class=${attr.className.add('$prefix-text')}>${...attr.children}</p>
	';

	public static function Body(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-body'), attr.children);
	}

	public static function Title(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-title').add('h5'), attr.children);
	}

	public static function Subtitle(attr:{?className:ClassName, children:Children}) {
		return Bootstrap.create(attr.className.add('$prefix-subtitle').add('h6'), attr.children);
	}

	public static function Link(attr:{href:String, ?className:ClassName, children:Children}) '
		<a href=${attr.href} class=${attr.className.add('$prefix-link')}>${...attr.children}</a>
	';
}
