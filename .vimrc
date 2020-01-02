let mapleader = ";"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'connorholyday/vim-snazzy'

Bundle 'majutsushi/tagbar'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub"
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" The monokai color scheme.
Plugin 'filfirst/Monota'

" The project source tree browser.
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" The enhanced editor status bar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" The enhanced C++ syntax highlighting.
Plugin 'octol/vim-cpp-enhanced-highlight'

" The auto-complete module.
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------- Monokai color scheme ----------
syntax on
"colorscheme Monota
"colorscheme dracula
colorscheme snazzy
"for snazzy

" ---------- General Settings ----------
set backspace=indent,eol,start

set scrolloff=5

syntax enable

" Show line numbers
set number

" Highlight matching brace
set showmatch

" Highlight all search results
set hlsearch

" Highlight the current cursor line
set cursorline

" Highlight the 80 columns margin.
"set colorcolumn=80

" Trim the trailing white space on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e

"when you want to check the spell
set nospell
"type z= to the selections.

set wildmenu
set wrap
set hlsearch
set incsearch
exec "nohlsearch"
set number
set t_Co=256
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>;

"--------split-----------
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <up> : res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"--------tabs----------
map tt :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

let &t_ut=''
noremap K 5k
noremap J 5j
map S :w<CR>
map Q :q<CR>
map R :source ~/.vimrc<CR>
" ---------- Indentation ----------
" Use spaces instead of tabs
set expandtab

" Number of spaces that a <TAB> in the file counts for
set tabstop=4

" Number of auto-indent spaces
set shiftwidth=4
set autoindent

" ---------- Folding ----------
set foldenable
set foldmethod=syntax

" Do not fold the code by default
set foldlevel=10000

" ---------- NerdTree Project Browser ----------
nnoremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" ---------- Enhanced C++ syntax highlighting ----------
let g:cpp_class_scope_highlight=1
let g:cpp_concepts_highlight=1
let g:cpp_experimental_simple_template_highlight=1


" ---------- YCM Auto Complete ----------
nnoremap <F12> :YcmCompleter GoTo<CR>

"let g:ycm_confirm_extra_conf = 0

nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
"let g:syntastic_ignore_files=[".*\.py$"]
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
"关键字补全
"let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
"-----------tagbar-------------
map <LEADER>m :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_right=1
