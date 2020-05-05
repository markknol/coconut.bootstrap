package bootstrap;

class Button extends View {
	static inline final prefix:String = 'btn';

	@:attribute var variant:Variant = Primary;
	@:attribute var size:Size = Size.Default;
	@:attribute var block:Bool = false;
	@:attribute var active:Bool = false;
	@:attribute var disabled:Bool = false;
	@:attribute var href:String = null;
	@:attribute var type:ButtonType = ButtonType.Default;

	@:attribute function onclick(e:#if js js.html.Event #else Any #end):Void {};

	@:attribute var className:ClassName = null;

	@:attribute var children:Children = null;
	@:attribute var label:String = null;

	function render() '
		<let classes=${className.add([
			'${prefix}' => true,
			'${prefix}-${variant}' => true,
			'${prefix}-${size}' => size != null,
			'${prefix}-block' => block,
			'${prefix}-disabled' => disabled,
			'active' => active,
		])}>
			<if ${href == null}>
				<switch ${type}>
					<case ${Default}>
						<button type="button" disabled=${disabled} className=${classes} onclick=${onclick}>${...children}</button>
					<case ${Input}>
						<input type="input" disabled=${disabled} className=${classes} onclick=${onclick} value=${label} />
					<case ${Reset}>
						<input type="reset" disabled=${disabled} className=${classes} onclick=${onclick} value=${label} />
					<case ${Submit}>
						<input type="submit" disabled=${disabled} className=${classes} onclick=${onclick} value=${label} />
				</switch>
			<else>
				<a href=${href} className=${classes}>${...children}</a>
			</if>
		</let>
	';
}

enum ButtonType {
	Default;
	Reset;
	Input;
	Submit;
}
