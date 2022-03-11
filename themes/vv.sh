# Vish's Theme

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'234'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
    # "tmux_session_info 240 232" \
    "hostname 121 8" \
    "date_day 214 0" \
    "date 220 0 ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}" \
    "time 211 0 ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}" \
    #"mailcount 9 255" \
    # "time 9 233 ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}" \   # "now_playing 238 255" \
    # "ifstat 250 0" \
    #"ifstat_sys 233 136" \
    # "cpu 240 13" \
    # "load 240 255" \
    #"weather 37 255" \
    # "lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}" \
    # "wan_ip 235 136 ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}"\
    # "vcs_branch 22 255" \
    # "vcs_compare 196 234" \
    # "vcs_staged 196 234" \
    # "vcs_modified 196 234" \
    # "vcs_others 196 234" \
  )
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    # "pwd 89 220" \
    # "cpu 240 13" \
    # "load 237 13" \
    "now_playing 252 17" \
    # "ifstat_sys 233 82" \
    # "uptime 233 136" \
    # "lan_ip 236 243 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}" \
    # "wan_ip 235 245 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}"\
    # "earthquake 3 0" \
    # "mailcount 9 255" \
    # "tmux_mem_cpu_load 234 136" \
    # "battery 236 251" \
    # "weather 37 255" \
    # "xkb_layout 125 117" \
    # "utc_time 160 0 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}" \
    # "date 160 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}" \
    "rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
  )
fi