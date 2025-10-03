{ config, pkgs, ... }:
{
	time.timeZone = "Europe/City";
	i18n = {
		# ru_RU.UTF-8
		# en_EU.UTF-8
		defaultLocale = "ru_RU.UTF-8";
		extraLocales = [ "ru_RU.UTF-8/UTF-8" ];
		extraLocaleSettings = {
		LANG = "ru_RU.UTF-8";
			LC_TIME = "ru_RU.UTF-8";
			LC_MESSAGES = "ru_RU.UTF-8";
		};
	};
}
