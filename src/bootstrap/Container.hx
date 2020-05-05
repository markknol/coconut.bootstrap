package bootstrap;

class Container extends View {
	static inline final prefix: String = 'container';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;
	@:attribute var fluid:Bool = false;
	function render() '
		<div class=${className.add(['$prefix' => true, '$prefix-fluid' => fluid])}>${...children}</div>
	';
}

class Row extends View {
	static inline final prefix: String = 'row';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	function render() return Bootstrap.create(className.add(prefix), children);
}

class Col extends View {
	static inline final prefix: String = 'col';
	// TODO: @:attribute var size: Size = Default;

	@:attribute var noGutters:Bool = false;

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	function render() '
		<div class=${className.add(['$prefix' => true, 'noGutters' => noGutters])}>${...children}</div>
	';
}

