function edit-cron --wraps='xdg-open (readlink -e /var/spool/cron/winston)' --description 'alias edit-cron=xdg-open (readlink -e /var/spool/cron/winston)'
  xdg-open (readlink -e /var/spool/cron/winston)
end
