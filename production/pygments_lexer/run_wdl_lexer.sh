mkdir html_output
cd ..
for i in `find . | grep '.wdl$'`;
  do f="$(basename -- $i)"
  echo $f
  pygmentize -f html -O full,style=default -o pygments_lexer/html_output/$f.html -l pygments_lexer/wdl_lexer.py -x $i
done;
