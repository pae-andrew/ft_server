nginx_conf='/etc/nginx/sites-available/gcrediblsite'
ai_on='autoindex on;'
ai_off='autoindex off;'

if [[ "$1" =~ ^(on|ON|off|OFF)$ ]]
then
	if grep -q "$ai_on" "$nginx_conf"
	then
		echo "autoindex is ON"
		if [[ "$1" =~ ^(off|OFF)$ ]]
		then
			sed -i "s/$ai_on/$ai_off/g" "$nginx_conf"
			state='OFF'
		else
			state='ON'
		fi
	elif grep -q "$ai_off" "$nginx_conf"
	then
		echo "autoindex is OFF"
		if [[ "$1" =~ ^(on|ON)$ ]]
		then
			sed -i "s/$ai_off/$ai_on/g" "$nginx_conf"
			state='ON'
		else
			state='OFF'
		fi
	fi
	service nginx restart
	echo "autoindex is now $state"
	exit 0
else
	echo "Incorrect input: Please enter argument 'on' or 'off'"
	exit 1
fi