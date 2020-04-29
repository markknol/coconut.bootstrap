package bootstrap.types;

enum abstract Size(String) to String {
	public static final all:Array<Size> = [ExtraLarge,Large,Default,Small,ExtraSmall];

	var ExtraLarge = 'xl';
	var Large = 'lg';
	var Default = 'md';
	var Small = 'sm';
	var ExtraSmall = 'xs';
}