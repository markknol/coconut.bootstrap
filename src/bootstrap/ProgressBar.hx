package bootstrap;

class ProgressBar extends View {
	public static final prefix = 'progress';
	static inline final precision = 1000;

	@:attribute var className:ClassName = null;
	@:attribute var variant:Variant = null;

	@:attribute var now:Float;
	@:attribute var height:EitherType<String, Float> = null;
	@:attribute var min:Float = 0.0;
	@:attribute var max:Float = 100.0;
	@:attribute var label:String = "";
	@:attribute var srOnly:Bool = false;
	@:attribute var striped:Bool = false;
	@:attribute var animated:Bool = false;

	function render() '
		<div class=${className.add('$prefix')} style="height: ${(height != null ? '${height}' : null)};">
			<div role="progressbar" 
				class=${[
					'$prefix-bar' => true,
					'bg-${variant}' => variant != null, 
					'$prefix-bar-animated' => animated, 
					'$prefix-bar-striped' => striped,
				]} 
				aria-valuenow=${now} 
				aria-valuemin=${min} 
				aria-valuemax=${max} 
				style="width: ${getPercentage(now, min, max)};">
				<if ${srOnly}>
					<span className="sr-only">${label}</span>
				<else>
					${label}
				</if>
			</div>
		</div>
	';

	public static function getPercentage(now:Float, min:Float, max:Float) {
		return (Math.round(((now - min) / (max - min)) * 100 * precision) / precision) + "%";
	}
}