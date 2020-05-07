package bootstrap;

class Spinner extends View {
	public static final prefix = 'spinner';

	@:attribute var className:ClassName = null;
	@:attribute var variant:Variant = null;
	@:attribute var type:SpinnerType = SpinnerType.Border;

	@:attribute var children:String = "Loading..";
	@:attribute var small:Bool = false;

	function render() '
		<span role="status" class=${className.add(['$prefix-$type' => true, '$prefix-$type-sm' => small, 'text-$variant' => variant != null,])} 
		>
			<span className="sr-only">${children}</span>
		</span>
	';
}

enum abstract SpinnerType(String) to String {
	var Grow = 'grow';
	var Border = 'border';
}
