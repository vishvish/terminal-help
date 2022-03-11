" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝

" By Vish Vishvanath
" v4.1

" █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
" ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
"
" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

" To use Python plugins, you need the "pynvim" module. Run |:checkhealth| to see
" if you already have it (some package managers install the module with Nvim itself).
" python3 -m pip install --user --upgrade pynvim
" python2 -m pip install --user --upgrade pynvim
" When you are using pyenv to manage python versions, then it is easy enough
" to just do pip install pynvim

" Set the python interpreter(s)
let g:python_host_prog = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'

" Ok, so this is a piece of configuration that you may not like, because it 
" checks to see if the vim-plug plugin manager is installed
" and if not, tries to install it. The source of this is found at vim-plug on GitHub:
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup neovim
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'Raimondi/delimitMate'
Plug 'gorkunov/smartpairs.vim' " Enchanted visual (selection) mode for Vim: just hit vv to select inside
Plug 'hashivim/vim-hashicorp-tools'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/tagbar'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'f-person/git-blame.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

lua <<EOF
require'navigator'.setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",     
  highlight = {
    enable = true              
  },
}
EOF

"  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗
" ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║
" ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║
" ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║
" ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
"  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

" Part 1: Stuff you care about customizing

"let mapleader='\' " Map leader to ,

" Part 2: Stuff you probably don't care about customizing

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set autoread " Set to auto read when a file is changed from the outside
set clipboard^=unnamed,unnamedplus " use the system clipboard for yank/put/delete - more portable version with ^=
" set cursorcolumn " highlight the current column, this will probably annoy the hell out of you after a while.
set cursorline " highlight the current line
set backspace=indent,eol,start " Fix backspace indent

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2 " How many spaces for >
set expandtab
set smartindent
set smarttab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

set background=dark
set cmdheight=1                 " how many lines to use for the command line
set encoding=utf-8              " saving and encoding
set ffs=unix,dos,mac            " EOL formats use when starting and reading files
set fileencoding=utf-8          " saving and encoding
set hidden                      " don't unload buffer when switching away
set lazyredraw                  " don't redraw while working to speed up things like reindenting
set mouse=a
set mousemodel=popup
set nobackup
set noswapfile
set splitbelow
set splitright
set ttimeout                    " see below
" set ttimeoutlen=100             " the time in milliseconds that is waited for a key code to complete
set whichwrap+=<,>,h,l,[,]
set writebackup
set autoindent
set formatoptions+=rtqn
set linespace=0
set nofoldenable
set nojoinspaces
set textwidth=0 " Hard wrap long lines when typing"
filetype plugin on
filetype indent on

set tags=./tags,tags;$HOME " From SO: It tells Vim to look for a tags file in the directory of the current file, in the current directory and up and up until your $HOME (that's the meaning of the semicolon), stopping on the first hit.

" Information
set modeline  " allow per-file settings via modeline
set number    " show absolute line number of the current line
set ruler     " show cursor position in status bar
set showcmd   " show command in status line
set showmatch " show matching bracket
set showmode
" set esckeys

" Tweaks
set synmaxcol=2048 " prevent slow downs from syntax highlighting

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" Avoid showing message extra message when using completion
set shortmess+=c

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" set completeopt=longest,menuone
" set completeopt-=preview

" Allow emoji completion

set completefunc=emoji#complete

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:terraform_fmt_on_save=1

" Git information in the gutter - most helpful
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1
silent! if emoji#available()
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" Changing the cursors depending on the mode.
" Modal cursors: Normal - block; Insert - I-beam; Replace - underline
if empty($TMUX)
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

let g:loaded_matchparen=1

let g:xtract_placeholders = {
\ "javascript": "import %s from './%s'",
\ "jsx": "import %s from './%s'",
\ "scss": "@import './%s';",
\ "sass": "@import './%s'",
\ "nginx": "include ./%s;",
\ }

" ██╗  ██╗███████╗██╗   ██╗    ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ██║ ██╔╝██╔════╝╚██╗ ██╔╝    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" █████╔╝ █████╗   ╚████╔╝     ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██╔═██╗ ██╔══╝    ╚██╔╝      ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║  ██╗███████╗   ██║       ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

"" :help map-modes if you need it.
"" :help map-overview gives you this:
"" Overview of which map command works in which mode.  More details below.

"" -------COMMANDS---------    MODES ~
"" :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
"" :nmap  :nnoremap :nunmap    Normal
"" :vmap  :vnoremap :vunmap    Visual and Select
"" :smap  :snoremap :sunmap    Select
"" :xmap  :xnoremap :xunmap    Visual
"" :omap  :onoremap :ounmap    Operator-pending
"" :map!  :noremap! :unmap!    Insert and Command-line
"" :imap  :inoremap :iunmap    Insert
"" :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
"" :cmap  :cnoremap :cunmap    Command-line

nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>
nmap     <silent> <F3> :TagbarToggle<CR>
map      <silent> <F4> :set paste!<CR>
map      <silent> <F5> :call QuickfixToggle()<CR>
nnoremap <silent> <F6> :buffers<CR>:buffer<Space>
nnoremap <silent> <F7> mzgg=G`z
map <silent> <F12> :CodeActionMenu
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
map <silent> <F12> :CodeActionMenu

" Fix fat-fingers
command!  WQ wq
command!  Wq wq
command!  Wqa wqa
command!  WQa wqa
command!  W w
command!  Q q
command!  QA qa
command!  Qa qa
nnoremap Q <nop>

"" functions we will use
let g:quickfix_is_open = 0

function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
  else
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" This ensures that a file's containing folders are all created before we save
"" that file.
"augroup Mkdir
"  autocmd!
"  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
"augroup END

"" Mac-like space bar to scroll.
nnoremap <Space> <C-F>


nnoremap § :FZF<CR>



""  █████╗ ██╗   ██╗████████╗ ██████╗  ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
"" ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
"" ███████║██║   ██║   ██║   ██║   ██║██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
"" ██╔══██║██║   ██║   ██║   ██║   ██║██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
"" ██║  ██║╚██████╔╝   ██║   ╚██████╔╝╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
"" ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

""  Autocommands are things that are run whenever a certain event happens

augroup filetypes
  autocmd!
  " Strip trailing whitespace from lines on save. Very nice.
  au BufWritePre *.tf,*.yml,*.rb,*.java,*.scala,*.go,*.py,*.js,*.hs,*.rs,*.html,*.css,*.scss :%s/\s\+$//e
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au FileType javascript set dictionary+=$HOME/.vim/dict/vim-node.dict
  au BufNewFile,BufRead *.fbp set filetype=coffee
  au BufNewFile,BufRead powerline.conf set filetype=tmux
  au BufNewFile,BufRead *.proxy set filetype=ruby
  au BufNewFile,BufRead *.ejs set filetype=html
  au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  " Prefer # comments for terraform
  au FileType terraform setl" Customize the cursorline - not in Insert mode
  au InsertLeave,WinEnter * set cursorline
  au InsertEnter,WinLeave * set nocursorline
  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
augroup END

""*****************************************************************************
""" Autocmd Rules
""*****************************************************************************
""" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

""" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup golang
  autocmd!
  au FileType go nmap <F3> <Plug>(go-test)
  au FileType go nmap <F6> <Plug>(go-run)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
augroup END

autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()

augroup rubyrails
  autocmd!
  au FileType ruby nmap <Leader>r :call RunCurrentSpecFile()<CR>
  au FileType ruby nmap <Leader>s :call RunNearestSpec()<CR>
  au FileType ruby nmap <Leader>l :call RunLastSpec()<CR>
  au FileType ruby nmap <Leader>a :call RunAllSpecs()<CR>
  au FileType ruby nmap <Leader>rh :let _last_pattern=@/<CR>:s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>:let @/=_last_pattern<CR>
augroup END

"" Fix large screen issue in iTerm with no mouse clicks registering on far right!
if has('mouse_sgr')
  set ttymouse=sgr
endif

" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '\.aux$', '\.bbl$', '\.bcf$', '\.blg$', '\.fdb_latexmk$', '\.fls$', '\.glo$', '\.glsdefs$', '\.idx$', '\.ilg$', '\.ind$', '\.ist', '\.run\.xml$', '\.synctex\.gz$', '\.toc$', '\.xdv$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

au FileType nerdtree setlocal nocursorcolumn


"" ██████╗ ███████╗ ██████╗ ██████╗ ██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
"" ██╔══██╗██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
"" ██║  ██║█████╗  ██║     ██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
"" ██║  ██║██╔══╝  ██║     ██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
"" ██████╔╝███████╗╚██████╗╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
"" ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

"" Disable Background Color Erase (BCE) so that color scheme work properly when
"" Vim is used inside tmux and GNU screen.
" set t_ut=

" turn on syntax highlighting
syntax on
set background=dark
" set t_Co=256

" Use the first available colorscheme in this list
for scheme in [ 'hobbes', 'base16-solarized', 'dracula', 'koehler', 'desert' ]
  try
    execute 'colorscheme '.scheme
    break
  catch
    continue
  endtry
endfor

" let &colorcolumn="80,120".join(range(120,500),",") " highlight the 80th column, also highlight columns 120+
let &colorcolumn="80,120" " highlight the 80th column, also highlight columns 120+


""Sets the colours of the popup menus
"" hi Pmenu ctermbg=226 " bright yellow
"" hi PmenuSel ctermbg=225
"" hi PmenuSbar ctermbg=255

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_bright'
let g:airline#extensions#branch#enabled = 0 " disable showing the branch
let g:airline#extensions#branch#format = 0 " if we are showing the branch, just show the end
let g:airline#extensions#tabline#enabled = 1
" For git-fugitive
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" ████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗███████╗
"" ╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝
""    ██║   ██║ █╗ ██║█████╗  ███████║█████╔╝ ███████╗
""    ██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗ ╚════██║
""    ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║
""    ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

" Speed up the response of changing mode, especially when in Tmux
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:tagbar_type_tf = {
  \ 'ctagstype': 'tf',
  \ 'kinds': [
    \ 'r:Resource',
    \ 'R:Resource',
    \ 'd:Data',
    \ 'D:Data',
    \ 'v:Variable',
    \ 'V:Variable',
    \ 'p:Provider',
    \ 'P:Provider',
    \ 'm:Module',
    \ 'M:Module',
    \ 'o:Output',
    \ 'O:Output',
    \ 'f:TFVar',
    \ 'F:TFVar'
  \ ]
\ }
