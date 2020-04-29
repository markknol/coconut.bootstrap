package bootstrap;

class Image extends View {
	static inline final prefix: String = 'img';

	@:attribute var className:ClassName = null;

	@:attribute var src:String;
	@:attribute var alt:String = "";

	@:attribute var fluid:Bool = false;
	@:attribute var rounded:Bool = false;
	@:attribute var roundedCircle:Bool = false;
	@:attribute var thumbnail:Bool = false;

	// use loading=lazy
	@:attribute var preload:Bool = true;

	function render() '
		<img 
			src=${src} 
			alt=${alt} 
			loading=${preload ? "lazy" : "auto"} 
			class=${className.add([
				'$prefix' => true, 
				'$prefix-fluid' => fluid,
				'rounded' => rounded,
				'rounded-circle' => roundedCircle,
				'$prefix-thumbnail' => thumbnail,
		])} />
	';
}