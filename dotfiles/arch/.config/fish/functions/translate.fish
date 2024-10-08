function translate --description 'Translates a string from one language to another'
  set -l text (string join %20 $argv[2..-1])
  set -l source_language (curl -s "https://winstxnhdw-nllb-api.hf.space/api/v4/detect_language?text=$text" | jq -r .language)
  curl -s "https://winstxnhdw-nllb-api.hf.space/api/v3/translate?text=$text&source=$source_language&target=$argv[1]" | jq -r .result
end
