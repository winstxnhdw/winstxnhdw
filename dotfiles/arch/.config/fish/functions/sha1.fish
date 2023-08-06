function sha1 --description 'Converts the input string to its equivalent SHA1 hash'
  echo -n $argv[1] | openssl sha1 | awk '{print $2}'
end
