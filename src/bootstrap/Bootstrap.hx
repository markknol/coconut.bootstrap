package bootstrap;

class Bootstrap {
	/** Lazy helper to create a `<div>` with class name	 */
	public static function create(className:tink.domspec.ClassName, children:coconut.ui.Children) return hxx('
		<div class=${className}>${...children}</div>
	');
}
