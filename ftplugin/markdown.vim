" File ~/.vim/ftplugin/markdown.vim
"
" key mappings
" Reformat paragraph
noremap <buffer> Q gq}

" text specific settings
setlocal colorcolumn=80
setlocal textwidth=82
setlocal tabstop=4
" For the amount of space used for a new tab use shiftwidth.
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal noexpandtab
setlocal formatoptions-=o
" use the par formatter
"setlocal formatprg=par
setlocal wrap
setlocal linebreak

" Format options
"set formatoptions=tcqrn1
"tcq is default
setlocal formatoptions=tcqr

" Turn off settings in 'formatoptions' relating to comment formatting.
" - t : Auto-wrap text using textwidth
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - q :	Allow formatting of comments with 'gq'.
"	    Note that formatting will not change blank lines or lines containing
"   	only the comment leader.  A new paragraph starts after such a line,
"	    or when the comment leader changes.
"
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" l	Long lines are not broken in insert mode: When a line was longer than
"   'textwidth' when the insert command started, Vim does not
"	automatically format it.
setlocal formatoptions-=o
setlocal formatoptions+=l

" j moves down a line, gj moves down one display line
" similar with k and gk for up
" comment out so they don't interfere with other buffers
" Also, these are taken care of by vim-pencil
" map j gj
" map k gk
"
" spelling and thesaurus
setlocal spell spelllang=en_us
" set thesaurus+= <path to thesaurus file>
" set complete+=s

