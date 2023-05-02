function zip --description 'Zips a file/directory'
  command -v zip && return
  bsdtar -czvf $argv
end
