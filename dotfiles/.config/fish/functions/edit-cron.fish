function edit-cron --wraps='sudoedit /var/spool/cron/winston' --wraps='vim /var/spool/cron/winston' --wraps='vim (readlink -e /var/spool/cron/winston)' --wraps='xdg-open (readlink -e /var/spool/cron/winston)' --description 'alias edit-cron=xdg-open (readlink -e /var/spool/cron/winston)'
  xdg-open (readlink -e /var/spool/cron/winston) $argv; 
end
