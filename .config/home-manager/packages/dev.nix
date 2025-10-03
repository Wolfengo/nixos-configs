{ pkgs, ... }:

{
	home.packages = with pkgs; [
		# --- Компиляторы и инструменты разработки ---
		gcc # C++ компилятор
 		binutils
		git
		cmake
		gnumake
	];

	#programs.git = {
	#	enable = true;
	#	userName = "USERNAME";
	#	userEmail = "EMAIL@EXAMPLE.com";
		# Дополнительные настройки, например, алиасы
		# aliases = {
		#	co = "checkout";
		#	ci = "commit";
		#	st = "status";
		#};
	#};
}
