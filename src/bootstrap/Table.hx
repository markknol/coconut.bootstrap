package bootstrap;

class Table extends View {
	public static final prefix = 'table';

	@:attribute var children:Children;
	@:attribute var className:ClassName = null;

	@:attribute var striped:Bool = false;
	@:attribute var bordered:Bool = false;
	@:attribute var hover:Bool = false;
	@:attribute var small:Bool = false;
	@:attribute var dark:Bool = false;
	@:attribute var responsive:Size = null;

	function render() '
		<div class=${[
			'$prefix-responsive-$responsive' => responsive != null
		]}>
			<table class=${className.add([
				'$prefix' => true, 
				'$prefix-striped' => striped,
				'$prefix-bordered' => bordered,
				'$prefix-sm' => small,
				'$prefix-hover' => hover,
				'$prefix-dark' => dark,
			])}>
				${...children}
			</table>
		</div>
	';
}