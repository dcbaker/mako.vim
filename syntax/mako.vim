" Vim syntax file
" Language:     Mako
" Maintainer:   Armin Ronacher <armin.ronacher@active-4.com>
" URL:          http://lucumr.pocoo.org/
" Last Change:  2008 September 12
" Version:	0.6.1
"
" Thanks to Brine Rue <brian@lolapps.com> who noticed a bug in the
" delimiter handling.

if exists("b:current_syntax") && b:current_syntax == "mako"
  finish
endif

"Put the python syntax file in @pythonTop
syn include @pythonTop syntax/python.vim

" End keywords
syn keyword makoEnd contained endfor endwhile endif endtry enddef

" Block rules
syn region makoLine matchgroup=makoDelim start=#^\s*%# end=#$# keepend contains=@pythonTop,makoEnd
syn region makoBlock matchgroup=makoDelim start=#<%!\?# end=#%># keepend contains=@pythonTop,makoEnd

" Variables
syn region makoNested start="{" end="}" transparent display contained contains=makoNested,@pythonTop
syn region makoVariable matchgroup=makoDelim start=#\${# end=#}# contains=makoNested,@pythonTop

" Comments
syn keyword makoTodo TODO XXX FIXME
syn region makoComment start="^\s*##" end="$" contains=makoTodo
syn region makoDocComment matchgroup=makoDelim start="<%doc>" end="</%doc>" keepend

" Attribute Sublexing
syn match makoAttributeKey containedin=makoTag contained "[a-zA-Z_][a-zA-Z0-9_]*="
syn region makoAttributeValue containedin=makoTag contained start=/"/ skip=/\\"/ end=/"/
syn region makoAttributeValue containedin=MakoTag contained start=/'/ skip=/\\'/ end=/'/

" Tags
syn region makoTag matchgroup=makoDelim start="<%\(def\|call\|page\|include\|namespace\|inherit\|block\|text\)\>" end="/\?>"
syn match makoDelim "</%\(def\|call\|namespace\|block\|text\)>"

" Newline Escapes
syn match makoEscape /\\$/

" Set highlighting
hi def link makoDocComment makoComment
hi def link makoDefEnd makoDelim

hi def link makoAttributeKey Type
hi def link makoAttributeValue String
hi def link makoDelim Preproc
hi def link makoEnd Keyword
hi def link makoComment Comment
hi def link makoEscape Special

if !exists("b:current_syntax")
	let b:current_syntax = "mako"
endif
