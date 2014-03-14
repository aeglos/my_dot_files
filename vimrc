" ____________________ "
" < vimrc of aeglos   >"
" -------------------- "
"    \                 "
"     \                "
"         .--.         "
"        |o_o |        "
"        |:_/ |        "
"       //   \ \       "
"      (|     | )      "
"     /'\_   _/`\      "
"     \___)=(___/      "
"  --------------------"
"
" set localleader
let maplocalleader=','

map <F2> : set nu!<BAR>set nonu?<CR>

"setlocal spell spelllang=en_us
map <F3> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
"change default template
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red
hi SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse

" switch between big5 & utf8
map <F5> :set tenc=big5<cr>
map <F6> :set tenc=utf-8<cr>

" if set paste is on, snipMate do not work
map <F10> :set paste!<bar>set paste?<CR>
set pastetoggle=<F10>

" 調整水平分割視窗大小
nmap + <C-W>+
nmap - <C-W>-
" 調整垂直分割視窗大小
nmap <Right>  <C-W>>
nmap <Left>  <C-W><

"以循環方式切換編輯緩衝區
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

"theme
"colorscheme killor

"ctrl + ] analyze by cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    "add any database in current directory
    if filereadable("cscope.out")
	cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
    endif
    set csverb
    set cscopetag
    set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-

    " s: Find this C symbol
    " map <localleader>fs :call CscopeFind('s', expand('<cword>'))<CR>
    map <localleader>fs :cs f s <cword><CR>
    " g: Find this definition
    " map <localleader>fg :call CscopeFind('g', expand('<cword>'))<CR>
    map <localleader>fg :cs f g <cword><CR>
    " d: Find functions called by this function
    " map <localleader>fd :call CscopeFind('d', expand('<cword>'))<CR>
    map <localleader>fd :cs f d <cword><CR>
    " c: Find functions calling this function
    " map <localleader>fc :call CscopeFind('c', expand('<cword>'))<CR>
    map <localleader>fc :cs f c <cword><CR>
    " t: Find this text string
    " map <localleader>ft :call CscopeFind('t', expand('<cword>'))<CR>
    map <localleader>ft :cs f t <cword><CR>
    " e: Find this egrep pattern
    " map <localleader>fe :call CscopeFind('e', expand('<cword>'))<CR>
    map <localleader>fe :cs f e <cword><CR>
    " f: Find this file
    " map <localleader>ff :call CscopeFind('f', expand('<cword>'))<CR>
    map <localleader>ff :cs f f <cword><CR>
    " i: Find files #including this file
    " map <localleader>fi :call CscopeFind('i', expand('<cword>'))<CR>
    map <localleader>fi :cs f i <cword><CR>
    map <localleader>fl :call ToggleLocationList()<CR>

endif

"C-\ - Open the definition in a new tab
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-]> :exec("tag ".expand("<cword>"))<CR>
"A-] - Open the definition in a vertical split
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Remove 'recording' key mapping
nmap q <Cr>
syntax on			"syntax on
set number			"show line number
set nocompatible		"vim default, not vi
"set selectmode=mouse
set hidden			"allow editing multiple unsaved buffers
set history=500			"remember the last 200 commands
set undolevels=1000		" use many muchos levels of undo
set wildmenu			"menu has tab completion, etc
set wildmode=list:longest	"in ESC: (command mode), disbled auto completion next part, Cool!
set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git,*.swp,*.bak,*.pyc,*.class
"set backupdir=~/vi_backup/	"set backup folder
"set backup			"produce backup file
set confirm			"confirm when conflict
"set mouse=nv "enable mouse to change window size
set laststatus=2		"status bar
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
"set statusline=File:\ %t\%r%h%w\ [%{&ff},%{&fileencoding},%Y]\ %m%=\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [LINE=%L]
highlight StatusLine ctermfg=blue ctermbg=white
":highlight 可以看到所有的顏色
hi Comment ctermbg=black ctermfg=darkcyan
set hlsearch			"highlight search result
highlight Search term=reverse ctermbg=4 ctermfg=7
set background=light
highlight Normal ctermbg=black ctermfg=white
highlight Pmenu ctermbg=5 ctermfg=white
highlight PmenuSel ctermbg=6 ctermfg=white
set ttyfast			" we have a fast terminal
set lazyredraw			" Do not redaw while running macros (faster)
set autoindent
set smartindent
set cindent
autocmd FileType c :set equalprg=indent
set noexpandtab " \t 不會以空白代替
"set tab = 8 space & noet for linux kernel coding style
set shiftwidth=4
set softtabstop=4		" press tab one time, jump 4 space. press second time become a really tab
set tabstop=8			" a tab is 8 spaces
set smarttab
"set foldmethod=marker		"fold by {{{}}}
"set foldmethod=indent		"fold by indent
"set foldopen=all		"enable fold
set nofen			"disable fold
"highlight Folded ctermbg=black ctermfg=darkcyan

" {{{ UTF-8 Big5 Setting
" 以下四個設下去. vim 編出來都是 utf-8 編碼的.
set fileencodings=big5,utf-8,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" 檔案存檔會存成utf-8編碼
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
" }}}
"
"imap <C-n> <Esc>:w<CR><Esc>
set tags=./tags,tags,GTAGS

" 會自動到最後離開的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

"set t_Co=256			"set 256 colors
set backspace=2			"allow backspace delete any char
set ruler			"show current position
set showmatch			"show matching brackets when typing
set showmode			"show current mode
set ffs=unix,dos ff=unix	" Favorite file types
set cmdheight=2
set nowrap
set wrapscan
set incsearch
set ignorecase
set smartcase
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set showcmd             " Show (partial) command in status line.
set autowrite           " Automatically save before commands like :next and :make

"For Python
"let python_highlight_builtins = 1
"let python_highlight_all = 1
" 為特定的檔案使用特殊的設定
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.html set ai et nu ts=4 sw=4
au BufRead,BufNewFile *.htm set ai et nu ts=4 sw=4
au BufRead,BufNewFile *.css set ai et nu ts=4 sw=4
au BufRead,BufNewFile *.rst set ai et nu ts=2 sw=2
au BufRead,BufNewFile *.go set filetype=go

"yahoo dict
map <C-K> viwy:!ydict <C-R>"<CR>

"google code search
function! OnlineDoc()
    let s:browser = "google-chrome"
    let s:wordUnderCursor = expand("<cword>")

    if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "php" || &ft == "python"
    let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor."+lang:".&ft
    elseif &ft == "vim"
    let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
    else
    return
    endif

    let s:cmd = "silent !" . s:browser . " " . s:url
    execute s:cmd
    redraw!
endfunction
" online doc search
map <LocalLeader>gc :call OnlineDoc()<CR>
" switch highlight search
"map <LocalLeader>hs : set hls!<BAR>set hls?<CR>
" edit .vimrc
map <LocalLeader>ev :tabnew ~/.vimrc<CR>

"fast switch between foo.c & foo.h
nmap <LocalLeader>c :find %:t:r.c <CR>
nmap <LocalLeader>h :find %:t:r.h <CR>

" tabs
map <LocalLeader>tt :tabnew<cr>
map <LocalLeader>te :tabedit<space>
map <localleader>tc :tabclose<cr>    " close a tab
map <localleader>tn :tabnext<cr>     " next tab
map <localleader>tp :tabprev<cr>     " previous tab
map <localleader>tm :tabmove<space>  " move a tab to a new location

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" QUICKFIX WINDOW Toggle
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
	cclose
	unlet g:qfix_win
    else
	copen 6
	let g:qfix_win = bufnr("$")
    endif
endfunction

nmap <localleader>q :QFix<CR>
nmap <localleader>w <C-W><C-W>

"show underline in current line
map <localleader>l :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>

"Compile
nmap <localleader>n :cn<CR>
nmap zn :cn<CR>
nmap <localleader>p :cp<CR>
nmap zp :cp<CR>
nmap <localleader>s :shell<CR>
nmap <localleader>d :q<CR>
"nmap <localleader><space> :make<CR>:QFix<CR>
"nmap <localleader>x :!./%:r
autocmd BufRead,BufNewFile *.c set makeprg=gcc\ -Wall\ %\ -g\ -o\ %:r
autocmd BufRead,BufNewFile *.c map <localleader><space> :make -g
autocmd BufRead,BufNewFile *.c map <localleader>x :!./%:r
autocmd BufRead,BufNewFile *.c map <F9> :!./%:r
autocmd BufRead,BufNewFile *.m set makeprg=clang\ -Wall\ %\ -g\ -o\ %:r
autocmd BufRead,BufNewFile *.m map <localleader><space> :make -g
autocmd BufRead,BufNewFile *.m map <localleader>x :!./%:r
autocmd BufRead,BufNewFile *.m map <F9> :!./%:r
autocmd BufRead,BufNewFile *.cc set makeprg=g++\ -Wall\ %\ -g\ -o\ %:r
autocmd BufRead,BufNewFile *.cc map <localleader><space> :make -g
autocmd BufRead,BufNewFile *.cc map <localleader>x :!./%:r
autocmd BufRead,BufNewFile *.cc map <F9> :!./%:r
autocmd BufRead,BufNewFile *.cpp set makeprg=g++\ -Wall\ %\ -g\ -o\ %:r
autocmd BufRead,BufNewFile *.cpp map <localleader><space> :make -g
autocmd BufRead,BufNewFile *.cpp map <localleader>x :!./%:r
autocmd BufRead,BufNewFile *.cpp map <F9> :!./%:r
autocmd BufRead,BufNewFile *.py map <localleader>x :!python ./%
autocmd BufRead,BufNewFile *.py map <F9> :!python ./%
autocmd BufRead,BufNewFile *.py map <localleader>g :!python -m pdb ./%
autocmd BufRead,BufNewFile *.rb map <localleader>x :!ruby ./%
autocmd BufRead,BufNewFile *.rb map <F9> :!ruby ./%
autocmd BufRead,BufNewFile *.pl map <localleader>x :!perl ./%
autocmd BufRead,BufNewFile *.pl map <F9> :!perl ./%
autocmd BufRead,BufNewFile *.sh map <localleader>x :!/bin/sh ./%
autocmd BufRead,BufNewFile *.sh map <F9> :!/bin/sh ./%
autocmd BufRead,BufNewFile *.go map <localleader><space> :!6g %;6l -o %:r %:r\.6
autocmd BufRead,BufNewFile *.go map <localleader>x :!./%:r
"autocmd BufRead,BufNewFile *.go map <F9> :!./%:r

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil <vim5632@rainslide.net>
function RemoveTrailingWhitespace()
    if &ft != "diff"
       let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
"autocmd BufWritePre * call RemoveTrailingWhitespace()
map <localleader>r : call RemoveTrailingWhitespace()<cr>

" show trailing white spaces
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"let g:pydiction_location=$HOME.'/.vim/ftplugin/pydiction/complete-dict'

"auto add python path & utf-8 to *.py
function PyHeader()
    if getfsize(@%) <= 0
        execute "norm i#!/usr/bin/env python# -*- coding: utf-8 -*-"
    endif
endfunction

au BufRead,BufNewFile *.py call PyHeader()

runtime! ftplugin/man.vim
map K <esc>:Man <cword><cr>

"set grepprg=grep\ -nH\ $*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hex/Binary Edit                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!
    au BufReadPre *.bin,*.hex,*.pkg,*.img,*.exe setlocal binary
    au BufReadPost *
          \ if &binary | Hexmode | endif
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()
" helper function to toggle hex mode
function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-x> :Hexmode<CR>

" For Python
function! s:python_custom()
    function! s:man(keyword)
        execute '!pydoc ' . a:keyword
    endfunction
    "setlocal tabstop=4 expandtab shiftwidth=4
    "setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3
    setlocal foldmethod=indent foldlevel=3 foldnestmax=3
    command! -nargs=1 Man call s:man(<f-args>)
    cnoremap K :!pydoc <cword><CR>
endfunction
if has("autocmd")
    autocmd Filetype python call s:python_custom()
endif

" Read HTML file as lynx
nmap <localleader>y :%!lynx -dump %<CR>

" Taglist
let g:Tlist_Auto_Update=1
let g:Tlist_Use_Right_Window=1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 40
"map <F12> :TlistToggle<cr>

" Tagbar
map <F12> :TagbarToggle<cr>

" ACP "
let g:acp_completeOption = '.,w,b,u,t,i,k'
"let g:acp_behaviorSnipmateLength = 1

"fun! GetSnipsInCurrentScope()
"    let snips = {}
"    for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
"      call extend(snips, get(s:snippets, scope, {}), 'keep')
"      call extend(snips, get(s:multi_snips, scope, {}), 'keep')
"    endfor
"    return snips
"  endf

"BufExplorer
"nmap <script> <silent> <unique> <localleader>be :BufExplorer<CR>
"nmap <script> <silent> <unique> <localleader>bs :BufExplorerHorizontalSplit<CR>
"nmap <script> <silent> <unique> <localleader>bv :BufExplorerVerticalSplit<CR>

" Add to make Vundle work
set nocompatible    " be iMproved
filetype off        " required!

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/CCTree'
Bundle 'vim-scripts/cscope.vim'
Bundle 'vim-scripts/QuickBuf'
Bundle 'sjl/gundo.vim'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
filetype plugin indent on    " required!

" Ag
nmap <localleader>a :Ag<CR>

"CCTree
set updatetime=0
let g:CCTreeCscopeDb = "cscope.out"
nnoremap <localleader>t :CCTreeLoadDB<CR><CR>
let g:CCTreeKeyTraceForwardTree = '<localleader>>'
let g:CCTreeKeyTraceReverseTree = '<localleader><'

"CtrlP
"noremap :CtrlPMRU
nnoremap <F4> :CtrlPMRU<CR>
let g:ctrlp_map = '<localleader>z'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" QuickBuf
let g:qb_hotkey = "<localleader>b"

" Gundo
nnoremap <F5> :GundoToggle<CR>
nnoremap <localleader>g :GundoToggle<CR>
