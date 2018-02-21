## Default Mac application launcher for bash
## by Markus Kroetzsch, 2010, http://korrekt.org/
## Published under the terms of GPL http://www.gnu.org/licenses/gpl.html
command_not_found_handler() {
	## (1) Try to find a suitable App ##
	appname=${1//_/-}
	appname=${appname//-/[-_\ ]}  # accept "-" and "_" as shortcuts for " "
	# echo "Searching Mac app that matches $appname.app ..."
	# A faster way to find Apps -- avoid searching through .app directories:
	app=`find /Applications -name "*.app" -prune | grep -i -m1 "/$appname.app"`

	## (2) Decide how to launch the App ##
	if [ "$app" != "" ]
	then
		shift 1
		file=$1
		shift 1
		if [ "$file" == "" ]
		then
			echo "Launching $app ..."
                	open -a "$app"
		else
			if [ "$1" == "" ]
			then
				echo "Launching $app on $file ..."
				open -a "$app" "$file"
			else
				echo "Launching $app on $file with parameters $@ ..."
				open -a "$app" "$file" --args "$@"
			fi
		fi
		return 0
	fi

	## Give up ##
	echo $"$1: command not found"
	return 127
}

source .zsh_prompt
