package bootstrap;

import coconut.vdom.View;

class Alert extends View {
	static inline final prefix:String = 'alert';

	@:state var show:Bool = true;

	@:attribute var variant:Variant = Primary;
	@:attribute var dismissible:Bool = false;
	@:attribute var closeLabel:String = 'Close alert';
	@:attribute var children:Children;

	@:attribute function onDismiss():Void {};

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
					<CloseButton onclick=${handleCloseButtonClick} label=${closeLabel} />
				</if>
				${...children}
			</div>
		</if>
	';

	private function handleCloseButtonClick():Void {
		show = false;
		onDismiss();
	}

	public static function Heading(attr:{children:Children}) {
		return Bootstrap.create("alert-heading h4", attr.children);
	}
}
