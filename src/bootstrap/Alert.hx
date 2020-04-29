package bootstrap;

import coconut.vdom.View;

class Alert extends View {
	static inline final prefix: String = 'alert';

	@:state var show: Bool = true;

	@:attribute var variant: Variant = Primary;
	@:attribute var dismissible: Bool = false;
	@:attribute var closeLabel: String = 'Close alert';
	@:attribute var children:Children;

	@:attribute function onclick():Void show = false; 

	function render() '
		<if ${show}>
			<div
				role="alert"
				className=${[
					'${prefix}' => true, 
					'${prefix}-${variant}' => true, 
				]}
			>
				<if ${dismissible}>
					<CloseButton onclick=${onclick} label=${closeLabel} />
				</if>
				${...children}
			</div>
		</if>
	';

	public static function Heading(attr:{children:Children}) {
		return Bootstrap.create("alert-heading h4", attr.children);
	}
}
