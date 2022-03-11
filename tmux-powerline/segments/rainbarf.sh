# Print out Memory and CPU using https://github.com/creaktive/rainbarf

run_segment() {
	type rainbarf >/dev/null 2>&1
	if [ "$?" -ne 0 ]; then
		echo 'rainbarf was not found'
		return
	fi

    # Customize via ~/.rainbarf.conf
	stats=$(rainbarf --nobattery --remaining --rgb --tmux --bright --width 20)
	if [ -n "$stats" ]; then
		echo "$stats";
	fi
	return 0
}
