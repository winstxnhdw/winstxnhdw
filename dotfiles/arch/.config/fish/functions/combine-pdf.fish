function combine-pdf --description 'Combine PDF files into one'
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$argv[1] $argv[2..-1]
end
