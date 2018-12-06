" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi, otherwise it conflicts with Vundle and
" other plugins
set nocompatible

" **** General behavior -- things most likely to be edited early in the file

" Change the leader key -- default is "\"
" Do this first early so references below use the new leader
let mapleader = ","

" set how many lines to read variables from
set modelines=0

" setup backup and swap related settings
set backup
set swapfile
set backupext=.bak
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
" make the first backup special
set patchmode=.orig

" turn on syntax highlighting
let python_highlight_all=1
syntax on

" show line numbers
set number

" show file stats
set ruler

" status bar
set laststatus=2 

" last line
" showmode is not needed with lightline
"set showmode
set noshowmode
set showcmd

" help quick screen redraw
set ttyfast

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" enable mouse support for scrolling
set mouse=a

" make a mark for column 80, but wrap after 120 columnns
" Filetype specifics are set below
" NOTE: vim-pencil plugin will alter this behavior when active
set colorcolumn=80
set textwidth=120
" set wrap on by default
set wrap

" set file type specifics in the ~/.vim/ftplugin/<filetype.vim> file

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" Blink cursor on error instead of beeping (grrr)
" set visualbell

" reload files changed outside vim
set autoread         

" use the system clipboard
set clipboard=unnamedplus

" allow hidden buffers -- dont't unload buffers when they are abandoned
" instead stay in the background
set hidden

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" underline the line the cursor is on
" Cursor highlight taken care of by color scheme
set cursorline

" Open splits on the bottom and right. Default is above and left
set splitbelow
set splitright 

" **** Command mapping
" Allow saving of files as sudo when I forgot to open them as sudo.
" This sends the buffer contents to the shell command tee which is run as sudo,
" and writes the buffer to the current file name
cmap Sw w !sudo tee > /dev/null %

" **** Key mapping
"
" FOR TRAINING, Remap arrow keys in normal mode to not do anyting... at least for now
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" remap the escape key to something easier to reach
" there will be a slight pause after the first 'j' waiting for the next one
" but this is visual, and should not cause a typing issue
" Go to normal (command) mode and eat up the moving back of the cursor.
imap jj <Esc>l
" Eat up the moving back of the cursor when going to normal (command) mode.
" This is commented out, because it causes letters to be printed when the arrow
" keys are pressed.
"imap <Esc> <Esc>l

" map <leader>O in normal modde to insert a line above without staying in insert mode
" map <leader>o in normal mode to insert a line below without staying in insert mode
nmap <leader>O O<Esc>
nmap <leader>o o<Esc>

" Make navigation for split windows easier
" Use the normal navigation keys and Ctrl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map the underscore = to a + so when using +/- to navigate up and down a line,
" the shift is not needed for the +
nnoremap = +

" opening additional buffers (files)
" These make it easier to open a file in the current directory by
" prepending the current directory
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
" assume vertical split unless sp is used.
map <leader>s :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>

" List contents of all registers (that typically contain pasteable text).
" i.e. shortcut for :reg/:registers
nnoremap <silent> "" :registers ".0123456789abcdefghijklmnopqrstuvwxyz-*+%/#<CR>

" **** Formatting
" Indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
" default to 4 tabs.  
" For the amount of space used for a new tab use shiftwidth.
" Set file type specifics in the ~/.vim/ftplugin/<filetype.vim> file
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
set tabstop=4

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
"map <leader><space> :let @/=''<cr> " clear search

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
" nnoremap <space> za

" **** File format related
" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" **** Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized
" set spelling errors to use underlines rather than red squiggly in terminals.
" The red squiggly does not show up in terminals.
" from solarized.vim color scheme file (for reference, not to be uncommented)
"exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
"exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
"exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
"exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
hi SpellBad cterm=underline term=underline ctermfg=red
hi SpellCap cterm=underline term=underline ctermfg=magenta
hi SpellRare cterm=underline term=underline ctermfg=cyan
hi SpellLocal cterm=underline term=underline ctermfg=yellow
" set spelling language, but turn spelling check off by default.
" Allow ftplugin/.vim files turn it on if wanted.
set spelllang=en_us
set nospell

" set the color theme to wombat256
"colorscheme wombat256
" and set the mark color to DarkSlateGray
"highlight ColorColumn ctermbg=lightgray guibg=lightgray

" **** Other settings

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" suggestion for normal mode commands
set wildmode=list:longest

" ---------------------- PLUGIN CONFIGURATION ----------------------
" Vundle and perhaps other plugins have trouble when filetype is on
" Turn off for now -- turn back on after plugins
filetype off
filetype plugin indent off

" initiate Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"****  start plugin defintion
" Foldin help
"Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1

" nerdtree file tree
Plugin 'scrooloose/nerdtree'
" toggle on leader n or Ctrl-n
map <leader>n :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" place, toggle and display marks
Plugin 'kshenoy/vim-signature'

" buffer management
Plugin 'Buffergator'

" file searching
"Plugin 'ctrlpvim/ctrlp.vim'

" vim session management
Plugin 'vim-misc'
Plugin 'https://github.com/xolox/vim-session.git'
    let g:session_autosave = 'no'

" syntax checking
Plugin 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    " when to auto check
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 1
    " use flake8 as the python checker
    let g:syntastic_python_flake8_exec = '/usr/bin/python3'
    " php checker
    let g:syntastic_php_checkers = ['php']


" PEP8 Python checking
Plugin 'nvie/vim-flake8'

" php checking
Plugin 'StanAngeloff/php.vim'

" auto complete

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
"conflicts with vim-pandoc
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/bin/python3'
" as you type popup and sematic trigger (i.e. popup after typeing . or -> in
" c++) popup. If off, you can force it with <C-Space>
let g:ycm_auto_trigger = 1
" to turn off just the identifier completer but keep the sematic tirggers
" set the min number of chars for completion to a large number
let g:ycm_min_num_of_chars_for_completion = 3
" config handling of .ycm_extra_config.py files for c family
" compilation/completion
" Config a global version if wanted
"let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Set to 1 if you want annoying confirmation of ycm file usage
let g:ycm_confirm_extra_conf=0

" let VIM and YouCompleteMe aware of python virtualenv
"python3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    print(project_base_dir)
"    activate_this = os.path.join(project_base_dir, '/bin/activate')
"    print(activate_this)
"    exec(open(activate_this).read())
"EOF

" how to ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" start nerdtree upon vim startup
" autocmd vimenter * NERDTree
" start nerdtree automatically on startup if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" start NERDTree on start-up and focus active window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'
" let g:NERDDefaultAlign = 'start'
" if defaultAlign is 'start' then also  disable NERDRemoveExtraSpaces
" let g:NERDRemoveExtraSpaces = 0
"
"Plugin 'vim-scripts/L9'
"Plugin 'vim-scripts/FuzzyFinder'

" Plugin vim-markdown for markdown (markup) support
" There are seveal options. I tried gabrielelana's version and couldn't tell 
" it was/wasn't doing.  Plastic boy (uses tabular) is another version I didn't try.
" Opted for vim-pandoc and associated syntax checker.
" Plugin 'gabrielelana/vim-markdown'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

" Integrate vim with pandoc converter and 
" support for pandoc markdown.
" Syntax checker isn't required, but is strongly recommended
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Enable pandoc functionality for markdown files while using the markdown
" file type and syntax.
" Setting `pandoc#filetypes#pandoc_markdown` to 0 will disable all pandoc
" functionality for markdown files, unless "pandoc" exists in the
" `pandoc#filetypes#handled` array.
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 0

" Plugin vim-pencil for writing
" NOTE: This will change wrapping behavior set with textwidth above
Plugin 'reedes/vim-pencil'
let g:pencil#mode_indicators= {'hard': 'pH', 'auto': 'pA', 'soft': 'pS', 'off': 'pencilOff',}
" hard line breaks or soft line wrap?
" set default, and then turn on pencil and init, based on file type
let g:pencil#wrapModeDefault= 'hard' " default is hard. Change to 'soft' if that is what you want
augroup pencil
  " first clear the command group
  autocmd!
  " leave argument out of pencil#init for auto detect
  " Comment out -- using pandoc instead
  "autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 0, 'textwidth': 82})
  "autocmd FileType text call pencil#init({'wrap': 'hard', 'autoformat': 0, 'textwidth': 82})
augroup END

" configurable status line
Plugin 'itchyny/lightline.vim'      
    let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \ 'left': [ ['mode', 'paste'],
    \         ['readonly', 'filename', 'modified', 'spell', 'syntastic', 'pencilMode'] ],
    \ 'right': [ [ 'lineinfo' ], ['percent'], 
    \          [ 'fileformat', 'fileencoding', 'filetype' ] ] 
    \ },
    \ 'component': {
    \ 'filename': '%F',
    \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ 'pencilMode': '%{PencilMode()}'
    \ },
    \ 'component_function': {
    \ 'spell': 'SpellInfo'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ 'component_expand': { 'syntastic': 'SyntasticStatuslineFlag' },
    \ 'component_type': { 'syntastic': 'error' }
    \}
" use this funcion to display the spelling info in the status line.
" Spelling language and spelling file it is specified
function! SpellInfo()
    return &spell ? &spellfile != '' ? 'L:' . &spelllang . ' F:' . &spellfile : 'L:' . &spelllang : 'no spell'
endfunction

" distraction free writing
" Goyo
Plugin 'junegunn/goyo.vim'
" disable fancy lightline staus line, but turn on minimum stuff
function! s:goyo_enter()
  " goyo disables lightline, so no need to call
  "call lightline#disable()
  set showmode
endfunction

function! s:goyo_leave()
  " goyo re-enables lightline, so no need to call
  "call lightline#enable()
  set noshowmode
  " reset spelling colors
  hi SpellBad cterm=underline term=underline ctermfg=red
  hi SpellCap cterm=underline term=underline ctermfg=magenta
  hi SpellRare cterm=underline term=underline ctermfg=cyan
  hi SpellLocal cterm=underline term=underline ctermfg=yellow
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

Plugin 'junegunn/limelight.vim'
" Limelight need to be able to calculate teh dimming down of surrounding
" paragraphs. It can't do this by default with the solarized color scheme.
" Help it by giving it these definitions/parameters
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240
  
  " Color name (:help gui-colors) or RGB color
  let g:limelight_conceal_guifg = 'DarkGray'
  let g:limelight_conceal_guifg = '#777777'
  
  " Default: 0.5
  let g:limelight_default_coefficient = 0.7
  
  " Number of preceding/following paragraphs to include (default: 0)
  let g:limelight_paragraph_span = 1
  
  " Beginning/end of paragraph
  "   When there's no empty line between the paragraphs
  "   and each paragraph starts with indentation
  let g:limelight_bop = '^\s'
  let g:limelight_eop = '\ze\n^\s'
  
  " Highlighting priority (default: 10)
  "   Set it to -1 not to overrule hlsearch
  let g:limelight_priority = -1

"Plugin 'Lokaltog/vim-easymotion'    
"Plugin 'tpope/vim-surround'         
" -- Web Development
"Plugin 'Shutnik/jshint2.vim'        
"Plugin 'mattn/emmet-vim'            
"Plugin 'kchmck/vim-coffee-script'   
"Plugin 'groenewege/vim-less'        
"Plugin 'skammer/vim-css-color'      
"Plugin 'hail2u/vim-css3-syntax'     
"Plugin 'digitaltoad/vim-jade'       

" end plugin definition
call vundle#end()            " required for vundle

" filetype off for plugins to load correctly -- turn it on now
filetype plugin indent on

" Format options
" Set formating options after filetype plugin runs to prevent
" them from being overwritten by ftplugin
"set formatoptions=tcqrn1
"tcq is default
set formatoptions=tcqr

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
setlocal formatoptions-=o


" map FuzzyFinder
"noremap <leader>b :FufBuffer<cr>
"noremap <leader>f :FufFile<cr>

" use zencoding with <C-E>
"let g:user_emmet_leader_key = '<c-e>'

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
"autocmd BufWritePost *.js silent :JSHint

" ---------------------- USER FUNCTIONS ----------------------
"
" Prose or Word Processor Mode
func! Prose()
    echo "Enter Prose/Word Processor Mode (user function)"
    " set file type to text so pandoc works
    setf pandoc
    " use pandoc and file type in place of vim-pencil
    "call pencil#init({'wrap': 'soft', 'autoformat': 0, 'textwidth': 82})
    "
    " formatoptions
    " l	Long lines are not broken in insert mode: When a line was longer than
    "   'textwidth' when the insert command started, Vim does not
    "	automatically format it.
    setlocal formatoptions=l
    setlocal noexpandtab
    " j moves down a line, gj moves down one display line
    " similar with k and gk for up
    " vim-pencil/pandoc should take care of this, so comment it out
    "map j gj
    "map k gk
    " spelling and thesaurus
    setlocal spelllang=en_us
    setlocal spell 
    " set thesaurus+= <path to thesaurus file>
    " set complete+=s
    " use the par formatter
    " setlocal formatprg=par
    setlocal wrap
    setlocal linebreak
    "load auto corrections (Auto Complete List ACL) as abbreviations
    if filereadable(expand('$HOME/.vim/abbreviations/AclAbbreviations.vim'))
      source $HOME/.vim/abbreviations/AclAbbreviations.vim
    endif

    " Turn on Goyo and set the width
    Goyo 90

    " Turn on Limelight
    "Limelight

endfu
command! WP call Prose() " Word Processing
command! PROSE call Prose()




