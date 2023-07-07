function edit-cron --wraps='xdg-open (readlink -e /var/spool/cron/$USER)' --description 'alias edit-cron=xdg-open (readlink -e /var/spool/cron/$USER)'
  xdg-open (readlink -e /var/spool/cron/$USER)
end
