package bootstrap;

class Badge extends View {
	static inline final prefix: String = 'badge';
	
	@:attribute var variant: Variant = Primary;
	@:attribute var pill: Bool = false;
	@:attribute var children:Children;

	function render() '
		<span className=${[
			'${prefix}' => true, 
			'${prefix}-pill' => pill,
			'${prefix}-${variant}' => true, 
		]}>${...children}</span>
	';
}