" http://briancarper.net/vim/vimrc
" http://github.com/ciaranm/dotfiles-ciaranm/blob/f149a43b56de330bf9254dc98ca02ca7c631e5b6/vimrc
"

set nocompatible
let mapleader = ","

filetype off 
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"GIT repositories
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'majutsushi/tagbar'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'Raimondi/delimitMate'
Bundle 'duff/vim-scratch'
Bundle 'tsaleh/vim-matchit'
Bundle 'spiiph/vim-space'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
"Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/syntastic'
Bundle 'sjbach/lusty'
Bundle 'mbadran/headlights'

"HTML/JS 
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'docunext/closetag.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'jquery'
Bundle 'JSON.vim'

"Cocoa
Bundle 'msanders/cocoa.vim'
Bundle 'objc_matchbracket.vim' 

"Vim Scripts
Bundle 'taglist.vim'
Bundle 'Command-T'
Bundle 'ShowMarks'
Bundle 'Vimball'
Bundle 'surround.vim'
Bundle 'YankRing.vim'
Bundle 'Parameter-Text-Objects'
Bundle 'AutoComplPop'
"Bundle 'vimwiki'
"Hand-Managed vimwiki dev branch
Bundle 'vimwiki-dev-2011-12-16' 
"Bundle 'web'

 

"['vim://repeat-2136', '8206'],
"['vim://lookupfile-1581', '7671'],
"['git://github.com/motemen/git-vim'],
"['git://github.com/sukima/xmledit'],
"['git://github.com/dsummersl/fuzzyfinder_textmate',true],
"['hg://bitbucket.org/ns9tks/vim-fuzzyfinder'],
"['vim://cecutil-1066', '7618'],
"['vim://align-294', '10110'],
"['vim://largefile-1506', '9277'],
"['vim://genutils-197', '11399'],
" 'git://github.com/timcharper/textile.vim.git',
" 'git://github.com/tpope/vim-cucumber.git',
" 'git://github.com/tpope/vim-fugitive.git',
" 'git://github.com/tpope/vim-git.git',
" 'git://github.com/tpope/vim-haml.git',
" 'git://github.com/tpope/vim-markdown.git',
" 'git://github.com/tpope/vim-rails.git',
" 'git://github.com/tpope/vim-vividchalk.git',
" 'git://github.com/tsaleh/vim-align.git',
" 'git://github.com/tsaleh/vim-shoulda.git',
" 'git://github.com/tsaleh/vim-tcomment.git',
" 'git://github.com/vim-ruby/vim-ruby.git', 
"['pythoncomplete', ''],
"['rails-1567', ''],
"['showmarks', ''],


filetype plugin indent on

"
set encoding=utf-8
set fileencoding=utf-8
set history=1000 "remember more commands 
set undolevels=1000 "remember more undos 
"set undoreload = 10000 "persistent undo level

"""
" Filetypes
"""

" edit gmail messages through /it's all text/ in mail mode
autocmd BufNewFile,BufRead mail.google.com.* setf mail
au VimLeave itsalltext/*.txt maca hide: "and reactivate program when done/

"au BufRead,BufNewFile *.as set filetype=actionscript
au BufRead,BufNewFile *.as set filetype=javascript


"""
" Appearance
""
set shortmess+=I
set ruler         
set showcmd
"set number
set relativenumber
set showmode
set lazyredraw

set showmatch     "highlight matching parens when typed
syntax on         "syntax highlighting

set nowrap
"set wrap
set linebreak
"set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85
set scrolloff=3  "show 3 lines above and below cursor

"colorscheme Mustang_Vim_Colorscheme_by_hcalves
colorscheme pigraph

"tabs and indent
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2 " >> and << ops
set softtabstop=2 
set expandtab "tabs to spaces
set shiftround "tab to sizeN instead of N+size
set nojoinspaces " Don't leave extra spaces when joining lines

if has('gui_running')
  "hide toolbar and scrollbar
  set guioptions-=T
  set guioptions-=r
  set lines=65
  set columns=130
  
  set guifont=Bitstream\ Vera\ Sans\ Mono:h11
 
  "red normal mode cursor
  highlight! nCursor guibg=red
  set guicursor+=n:block-blinkon0-nCursor
  
  "just show modified indicator and filename in gui tabs
  "keeps tabs readable with long dirs
  set guitablabel=%m%t
endif

"no bells, thanks
set vb t_vb=

"let cursor roam in cmd mode
" set virtualedit=all
                                                
"status line
set laststatus=2 "show status when only 1 buffer
set statusline =
"set statusline+=%2*%-3.3n%0*\         " buffer number
set statusline+=%#User1#%m%r%h%w              " flags
set statusline+=%#User2#%{CurDir()}
"set statusline+=%F\                   " file path
set statusline+=%=                    " right align rest of this
set statusline+=%#User1#[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}] "[encoding retFmt filetype]                          
set statusline+=\ %12.(%c:%l/%L%)\ 	"col:line/totalLines


function! CurDir()
    let curdir = substitute(substitute(getcwd(), '/Users/brandongoldsworthy', "~", "g"), 'Documents/Working', "[W]", "g")
    return curdir
endfunction

"""
" VIM Behavior 
"""

" Use OS clipboard for c/y/d ops
set cb=unnamed

"Search
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault "global replace


"misc
"set spell           
"set autochdir     "switch to loaded file dir
set hidden        "change buffers without saving

" Backup
set backup
"set undofile
" I want all my backups and swaps in separate directories
" instead of littering my filesystem
let s:homedir = "$HOME"
execute "set backupdir=" . s:homedir . "/Documents/.backups"
execute "set directory=" . s:homedir . "/Documents/.swap"
"execute "set undodir=" . s:homedir . "/Documents/.undo"


" Enable folds
set foldenable
set foldmethod=manual
"set foldmethod=syntax
set foldlevelstart=9999

" The text to return for a fold
function! FoldText()
    let numlines = v:foldend - v:foldstart
    let firstline = getline(v:foldstart)
    "let spaces = 60 - len(firstline)
    return printf("%3d ¬ª %s ", numlines, firstline)
endfunction
set foldtext=FoldText()



"""
" Shortcuts
"""
nmap <leader>ve :edit $MYGVIMRC<CR>
nmap <leader>vs :source $MYGVIMRC<CR>

" Use jj to exit insert mode
inoremap jj <ESC>l

" Use S to 'Stamp' yanked word over current word
nnoremap S diw"0P

" single quote for back tick. No reaching for marks
nnoremap ' `

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Quick substitute
nnoremap <leader>s :%s//<left>


" Use tab & shift+tab to indent/unindent lines in normal mode
nmap <tab> >>
nmap <s-tab> <<

" Use tab & shift+tab to indent/unindent lines in visual mode
vmap <tab> >gv
vmap <s-tab> <gv

"make sure j,k move screen lines instead of file lines
nnoremap j gj
nnoremap k gk

"quick close
nmap <leader>d :bd<CR>
nmap <leader>D :bd!<CR>

" insert line below, return to current position without leaving normal mode
nmap <leader>o mzo<Esc>'z
" insert line above, return to current position without leaving normal mode
nmap <leader>O mzO<Esc>'z


"jump to next non-blank line before blank up and down
"nnoremap <silent> <leader>j /^$/-1<CR>^:nohlsearch<CR>
"nnoremap <silent> <leader>k ?^$?+1<CR>^:nohlsearch<CR>

" show whitespace with ,w
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" split line at cursor
nmap <leader>x a<cr><esc>k$

"clear search buffer
nmap <silent> <leader>/ :nohlsearch<CR>

"consistency with D and C
nmap Y y$

"allows you to quick record a macro with qq and play it with Q
map Q @q 

" delete/cut 'inside' line i.e. not incl. the whitespace
nmap dil ^D
nmap cil ^C

"I almost never want to go all the way back and 0 is easer to hit
noremap 0 ^
noremap ^ 0

" quick append comma or semicolon to line in normal mode
"nmap <leader>, $a,<ESC> 
nmap <leader>; $a;<ESC> 

"quick working dir switching
nmap <leader>.. :cd ..<CR>
nmap <leader>./ :cd %:p:h<CR>
nmap <leader>.w :cd ~/Documents/Working/<CR>
nmap <leader>.c :cd ~/Documents/Working/MyJoys\ Customizer/customizer/www/js/<CR>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>mm mmHmt:%s/<C-V><cr>//<cr>'tzt'm
" Add newlines too
noremap <leader>gm mmHmt:%s/<C-V><cr>/\r/<cr>'tzt'm

"After Tab completion use C-n to keep typing to narrow matches
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  
"Swapping parameter order via http://www.reddit.com/r/vim/comments/l1nji/quickest_way_to_rearrange_a_list_of_elements/
function! ReorderParams(params)
    let params = split(a:params, ',\s*')
    let order = input(string(map(copy(params), 'v:key + 1 . ": " . v:val')))
    let @* = join(map(split(order, '[0-9]\zs'), 'params[str2nr(v:val) - 1]'), ', ')
    normal P
endfunction
nnoremap <F12> di(:call ReorderParams(@")<CR>


" Use ,q to edit macro in a new split and then ,2 to suck it back into the macro's register
nnoremap <leader>q :Sscratch<CR>:res 1<CR>"qp 
nnoremap <leader>2 "qdd:q<CR>

" Open current file for Markdown HTML preview
nnoremap <leader>md :silent !open -a Marked.app '%:p'<cr>

nnoremap <leader>a :Ack 

" Markdown  Header helpers
nnoremap <leader>=  yypv$r=
nnoremap <leader>-  yypv$r-

"""
" Windows Management
"""
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
" Move to or Create window
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

"Closing and rotating
map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

"Moving
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr> 

"Resizing"
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

"""
" Plugin Config
"""
map <leader>gg :vimgrep // *<left><left><left><left>
map <leader>gp :vimgrep /<C-R>"/ *

let g:showmarks_enable = 0

nnoremap <leader>, :LustyJugglePrevious<CR>
nnoremap <leader>b :LustyJuggler<CR>


" add quick surround actions on '-' and '=' for asp files
au FileType aspvbs let b:surround_45 = "<% \r %>"
au FileType aspvbs let b:surround_61 = "<%= \r %>" 
" use & to wrap multi-line strings with quotes and line cont. chars
au FileType aspvbs let b:surround_38 = "\"\r\" &_"

nnoremap <leader>u :GundoToggle<CR>

nnoremap <leader>p :YRShow<cr>
inoremap <leader>p <ESC>:YRShow<cr>

nnoremap <leader>t :CommandT<cr>

" Don't know why this isn't working. it looks like the active var isn't
" accessible in the toggle functions
"call rainbow_parentheses#LoadRound ()
"call rainbow_parentheses#LoadBraces ()
"call rainbow_parentheses#LoadSquare ()
"nnoremap <leader>r :RainbowParenthesesToggle<CR>

set wildmenu " :e ^D to browse dirs with tab completion
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png "ignore these in tab complete
set wildmode=list:longest 

let g:vimwiki_list = [
    \ {'path': '~/Documents/Dropbox/trunksync/notes/', 'index': 'VimHome', 'path_html': '~/trunknotes_html', 'ext': '.txt', 'syntax': 'markdown'},
    \ {'path': '~/Documents/Working/OIWiki', 'index': 'OiToDo', 'path_html': '~/Documents/Working/OIWiki_html', 'ext': '.markdown', 'syntax': 'markdown'},
    \ {'path': '~/Documents/Dropbox/personalwiki/', 'index': 'Index', 'path_html': '~/personalwiki_html', 'ext': '.txt', 'syntax': 'markdown'}
    \ ]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_auto_checkbox = 1
map <leader>wc :VimwikiToggleListItem<CR>

map <leader>wo 2,ww
map <leader>wp 3,ww

nmap <leader>id a<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>
nmap <leader>it a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

"""
" AutoComands
"""
augroup Markdown
  au! BufRead,BufNewFile,BufEnter *
        \ set textwidth=0 colorcolumn=0

  au! BufRead,BufNewFile,BufEnter *.md,*.markdown,*.mkd,*.txt
        \ set textwidth=80 colorcolumn=80 
augroup END

"I like the idea of Lokaltog's Powerline, but don't want to bother configuring it when I've already got a statusline I like

hi User1  gui=none guifg=#000000 guibg=#b1d631
hi User2  gui=none guibg=#1d2124

hi User3  gui=none guifg=#FFFFFF guibg=#0087af
hi User6  gui=none guifg=#FFFFFF guibg=#005972

hi User4  gui=none guifg=#FFFFFF guibg=#990000
hi User5  gui=none guifg=#FFFFFF guibg=#660000

let g:Active_statusline=&g:statusline
let g:NCstatusline= substitute(g:Active_statusline, 'User1', 'User2', 'g')
let g:Insertstatusline= substitute(substitute(g:Active_statusline, 'User1', 'User3', 'g'), 'User2', 'User6', 'g')
let g:UtilStatusLine= substitute(substitute(g:Active_statusline, 'User1', 'User4', 'g'), 'User2', 'User5', 'g')

function! GetStatusLine(mode)
  if (a:mode == 'Normal') 
    let &l:statusline= g:Active_statusline 
  elseif (a:mode == 'Insert') 
    let &l:statusline= g:Insertstatusline 
  elseif (a:mode == 'Util') 
    let &l:statusline= g:UtilStatusLine 
  else
    let &l:statusline=g:NCstatusline
  endif
endfunction

    
augroup FancyStatusLine
    autocmd! 

    au BufEnter,BufWinEnter,WinEnter,CmdwinEnter,CursorHold,BufWritePost,InsertLeave *
      \ call GetStatusLine("Normal")

    au BufLeave,BufWinLeave,WinLeave,CmdwinLeave *
      \ call GetStatusLine("Inactive")

    au InsertEnter,CursorHoldI *
      \ call GetStatusLine("Insert")

    au BufNewFile,BufEnter,BufWinEnter,WinEnter,CmdwinEnter,CursorHold,BufWritePost,InsertLeave,
          \BufLeave,BufWinLeave,WinLeave,CmdwinLeave __Gundo*__,[Yank*
      \ call GetStatusLine("Util")

augroup end 

