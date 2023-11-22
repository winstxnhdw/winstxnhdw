function translate --description 'Translates a string from one language to another'
  curl -N 'https://winstxnhdw-nllb-api.hf.space/api/v2/translate' \
       -H 'Content-Type: application/json' \
       -d \
       "{
           \"text\": \"$argv[3..-1]\",
           \"source\": \"$argv[1]\",
           \"target\": \"$argv[2]\"
       }"
end
