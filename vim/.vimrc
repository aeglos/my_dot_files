
" NERD TREE " {{{
" notes:
"
" o       Open selected file, or expand selected dir               
" go      Open selected file, but leave cursor in the NERDTree     
" t       Open selected node in a new tab                          
" T       Same as 't' but keep the focus on the current tab        
" <tab>   Open selected file in a split window                     
" g<tab>  Same as <tab>, but leave the cursor on the NERDTree      
" !       Execute the current file                                 
" O       Recursively open the selected directory                  
" x       Close the current nodes parent                           
" X       Recursively close all children of the current node       
" e       Open a netrw for the current dir                         

" default <leader> is '\'
map <leader>e :NERDTreeToggle<CR>
"}}}

" all my macros start with ,
" let maplocalleader=','          

"這樣Ctrl-]的跳轉將由cscope的tags進行分析
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
       endif
        
" big5 & utf8 切換
map <F7> :set tenc=big5<cr>
map <F8> :set tenc=utf-8<cr>
map <F4> :NERDTreeToggle<cr>
map <F12> :Tlist<cr>
nnoremap <silent> <f9> :wincmd p<cr>

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"語法高亮度
syntax on

"顯示行號
set number

"高亮度顯示搜尋文字
set hls
set ic
set ru
set ai
set nobackup
set nocompatible
set selectmode=mouse

" remember the last 200 commands
set history=200                 
"nmap l <End>
set ft=c
set nocp

" : menu has tab completion, etc
set wildmenu                    
" 設定 vim 編輯預設備份目錄, 必須先 mkdir ~/vi_backup/
"set backupdir=~/vi_backup/
"set backup

set wrap

set confirm  " 操作過程有衝突時，以明確的文字來詢問你該如何做？(而不是顯示錯誤訊息) 

" 這是防止在做剪貼時位置會不正確
"set paste
set pastetoggle=<F10> "用滑鼠複製文字，先按一下 <F10> 鍵再貼上，就不會亂了版面 

":highlight 可以看到所有的顏色
" save .vimrc, auto exec, .vimrc 如果存檔, 就會立刻實現
autocmd! bufwritepost .vimrc source %

"highlight Folded ctermbg=black ctermfg=darkcyan
highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse  
hi Comment ctermbg=black ctermfg=darkcyan
"
" 下面出現一列 bar.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white

" 搜尋到的字加 hilight
set hlsearch

" 將註解由深藍色變綠色
"hi Comment ctermfg=Green

set background=light
"colorscheme desert
"colorscheme state
set sw=4
highlight Search term=reverse ctermbg=4 ctermfg=7
highlight Normal ctermbg=black ctermfg=white

set ttyfast                   " we have a fast terminal
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

"自動縮排
set cindent
set autoindent
set smartindent
"
" \t 會以 4個空格代替
"set expandtab
"or set et
" \t 不會以空白代替
set noet
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set cino=>4

"
" :sp 開檔時, 上面會列出所有檔案
set wildmenu

" 可以用 {{{ }}} 縮排 Folded
"set foldmethod=marker
" 依縮排摺疊字句
"set foldmethod=indent
"
" 可設定fold預設為打開
"set foldopen=all
" 可設定沒有folding
set nofen

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
"nnoremap <silent> <F9> :set paste<CR>

" 會自動到最後離開的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

set tags=./tags,tags
"map <C-Right> :tabnext<CR>
"map <C-Left>  :tabprevious<CR>
"map <C-]> viwy:tab tag <C-R>"<CR>
"
imap <F11> <Esc>:ls<CR>:bu
map <F11> :ls<CR>:bu
        
"設定vim為256色
"set t_Co=256

"backspace 為 2 時，就是可以刪除任意值；
"0 或 1 時，僅可刪除剛剛輸入的字元， 而無法刪除原本就已經存在的文字了！
set backspace=2
 
"顯示行列位置
set ruler
 
"自動找對應括號
set showmatch
 
set ffs=unix,dos ff=unix
set cmdheight=2

"vim會自動針對C或C++語言來做indent縮排
set nowrap
set incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr

" 設定使用 /usr/bin/indent 來重整code
set equalprg=/usr/bin/indent

"For Python
"let python_highlight_builtins = 1
"let python_highlight_all = 1
" 為特定的檔案使用特殊的設定
au BufRead *.py set ai et nu sw=4 ts=4 tw=79
au BufRead *.html set ai et nu ts=4 sw=4
au BufRead *.htm set ai et nu ts=4 sw=4
au BufRead *.css set ai et nu ts=4 sw=4
au BufRead *.rst set ai et nu ts=2 sw=2

"ydict
map <C-K> viwy:!ydict <C-R>"<CR>
"自動移除行尾多餘空白
autocmd FileType c,cpp,java,php,perl,python,ruby,sh autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"google code search
function! OnlineDoc()
    let s:browser = "lynx"
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


"切換原始檔(.c)與標頭檔(.h)的快速鍵
"將,c對應至搜尋原始檔(也就是.c檔)
nmap ,c :find %:t:r.c 
"---> 將,h對應至搜尋標頭檔(也就是.h檔)
nmap ,h :find %:t:r.h 
 
" tabs
"map <LocalLeader>tc :tabnew %<cr>    " create a new tab       
"map <LocalLeader>tc :tabnew <cr>    " create a new tab       
"map <LocalLeader>td :tabclose<cr>    " close a tab
"map <LocalLeader>tn :tabnext<cr>     " next tab
"map <LocalLeader>tp :tabprev<cr>     " previous tab
"map <LocalLeader>tm :tabmove         " move a tab to a new location

