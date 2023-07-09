function edit-cron --wraps='open (readlink -e /var/spool/cron/$USER)' --description 'alias edit-cron=open (readlink -e /var/spool/cron/$USER)'
  open (readlink -e /var/spool/cron/$USER)
end
