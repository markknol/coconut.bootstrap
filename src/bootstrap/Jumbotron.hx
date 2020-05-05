package bootstrap;

class Jumbotron extends View {
	public static final prefix = 'jumbotron';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	@:attribute var fluid:Bool = false;

	function render() '
		<div class=${className.add(['$prefix' => true, '$prefix-fluid' => fluid])}>${...children}</div>
	';
}
