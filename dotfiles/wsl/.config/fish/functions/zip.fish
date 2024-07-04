function zip --description 'Zips a file/directory'
  bsdtar -aczvf $argv
end
