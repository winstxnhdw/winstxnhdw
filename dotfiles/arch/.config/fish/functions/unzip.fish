function unzip --description 'Unzip a file'
  set -l output_directory (echo $argv[1] | rev | cut -f 2- -d '.' | rev)
  mkdir $output_directory
  bsdtar -xvf $argv[1] -C ./$output_directory
end
