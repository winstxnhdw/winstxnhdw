chosen=$(echo -e "Logout [L]\nShutdown [S]\nReboot [R]" | dmenu)

if [[ $chosen = "Logout" ]]; then
	pkill X
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
fi
