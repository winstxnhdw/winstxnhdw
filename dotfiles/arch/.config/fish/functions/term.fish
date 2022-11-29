function term --wraps='nohup $TERM > /dev/null 2>&1 &' --description 'alias term=nohup $TERM > /dev/null 2>&1 &'
  nohup $TERM > /dev/null 2>&1 & 
end
