package bootstrap.types;

enum abstract Variant(String) to String {
	public static final all:Array<Variant> = [Primary, Secondary, Success, Danger, Warning, Info, Dark, Light];
	public static final allOutline:Array<Variant> = [
		OutlinePrimary,
		OutlineSecondary,
		OutlineSuccess,
		OutlineDanger,
		OutlineWarning,
		OutlineInfo,
		OutlineDark,
		OutlineLight
	];
	var Primary = 'primary';
	var Secondary = 'secondary';
	var Success = 'success';
	var Danger = 'danger';
	var Warning = 'warning';
	var Info = 'info';
	var Dark = 'dark';
	var Light = 'light';
	var Link = 'link';
	var OutlinePrimary = 'outline-primary';
	var OutlineSecondary = 'outline-secondary';
	var OutlineSuccess = 'outline-success';
	var OutlineDanger = 'outline-danger';
	var OutlineWarning = 'outline-warning';
	var OutlineInfo = 'outline-info';
	var OutlineDark = 'outline-dark';
	var OutlineLight = 'outline-light';
}
