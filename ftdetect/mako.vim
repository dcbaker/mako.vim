" This uses my personal preference to name mako files as an assumption
" *.mako is used for mako libraries
" *.py.mako is used for python files
" *.c.mako is used for c files
" *.h.mako is used for c header files, etc

autocmd BufNewFile,BufRead *.mako set ft=mako
autocmd BufNewFile,BufRead *py.mako set ft=py-mako
autocmd BufNewFile,BufRead *c.mako set ft=c-mako
autocmd BufNewFile,BufRead *h.mako set ft=c-mako
autocmd BufNewFile,BufRead *cpp.mako set ft=c-mako
autocmd BufNewFile,BufRead *hpp.mako set ft=c-mako
autocmd BufNewFile,BufRead *html.mako set ft=html-mako
autocmd BufNewFile,BufRead *xml.mako set ft=xml-mako
