function translate --description 'Translates a string from one language to another'
  curl 'https://winstxnhdw-nllb-api.hf.space/api/v3/translate?text=($argv[3..-1] | string join %20)&source=$argv[1]&target=$argv[2]'
end
