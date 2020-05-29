"" ---- vim-autoformat ----

" Python
let g:formatdef_autopep8 = "'autopep8 --ignore=E402,E501'"
let g:formatters_python = ['autopep8', 'yapf', 'black']

" format when write file
au BufWrite *.c :Autoformat
au BufWrite *.cc :Autoformat
au BufWrite *.cpp :Autoformat
au BufWrite *.cxx :Autoformat
au BufWrite *.h :Autoformat
au BufWrite *.hpp :Autoformat
au BufWrite *.hxx :Autoformat
au BufWrite *.py :Autoformat
au BufWrite *.js :Autoformat
au BufWrite *.ts :Autoformat
au BufWrite *.go :Autoformat
au BufWrite *.rs :Autoformat
au BufWrite *.json :Autoformat
au BufWrite *.html :Autoformat
au BufWrite *.xml :Autoformat
au BufWrite *.css :Autoformat
au BufWrite *.less :Autoformat
au BufWrite *.sass :Autoformat
au BufWrite *.scss :Autoformat
au BufWrite *.hs :Autoformat
au BufWrite *.rb :Autoformat
au BufWrite *.pl :Autoformat
au BufWrite *.pl6 :Autoformat
au BufWrite *.perl :Autoformat
au BufWrite *.hql :Autoformat