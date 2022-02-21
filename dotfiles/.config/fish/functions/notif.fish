function notif --description 'Toggles Dunst notifications'
  switch $argv
    case 'on'
      echo "Dunst notifications has been turned on."
      command dunstctl set-paused false
    
    case 'off'
      command dunstctl set-paused true
      echo "Dunst notifications has been turned off."
    
    case '*'
      echo "Usage: notif [on|off]"
      return
  end
end
