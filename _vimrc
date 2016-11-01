set nocompatible "required
filetype off	 "required

set guifont=Ubuntu_Mono_derivative_Powerlin:h10:cANSI:qDRAFT


" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All plugins below this line
" ==================================================

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

    "-------------------=== Other ===-------------------------------
    Plugin 'vim-airline/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    " Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'Raimondi/delimitMate'               "auto-completion for quotes, parens, brackets, etc.

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin

    "-------------------=== Python  ===-----------------------------
    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    " Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
    Plugin 'cjrh/vim-conda'			            "Python devp using conda env
    " Plugin 'Valloric/YouCompleteMe'             " auto completion package
    Plugin 'Shougo/neocomplete.vim'             " auto completion package

    "-------------------=== Notes === -------------------------------
    Plugin 'xolox/vim-notes'                    " Vim Notes
    Plugin 'xolox/vim-misc'
    Plugin 'itchyny/calendar.vim'                " Vim calendar
    Plugin 'vimwiki/vimwiki'                     " Vim wiki

" ==================================================
" All plugins must be added before the following line
call vundle#end()		"required
filetype on
filetype plugin on
filetype plugin indent on	"required

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
:let mapleader = ","                        " leader key
set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme
set lines=40 columns=100                    " set initial vim window size
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_ctags_bin="A:/VIM/vim80/ctags.exe"
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete "enable omnicomletion

" python executables for different plugins
let g:pymode_python='python'
let g:syntastic_python_python_exec='python'
let g:jedi#force_py_version=2

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_key='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst match Excess /\%81v.*/
    autocmd FileType python,rst set nowrap
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" jedi-vim
"let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
"let g:jedi#show_call_signatures=0           " Show call signatures
"let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot

" neocomplete
let g:neocomplete#enable_at_startup = 1      " Use neocomplete.
let g:neocomplete#enable_smart_case = 1      " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3  " Set minimum syntax keyword length.
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" C tags
" let g:tagbar_ctags_bin="A:/VIM/vim80/ctags/"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" Vim-Conda
map <F4> :CondaChangeEnv<CR>
let g:conda_startup_msg_suppress = 0 "suppress the vim startup

" Vim Notes
:let g:notes_directories = ['~/NotesDocument/Notes']
:let g:notes_suffix = '.txt'
:let g:notes_word_boundaries = 1
" ==================================================
" Old stuff
" ==================================================

" " put non-Plugin stuff after this line

"split navigations
nnoremap <C-J> <C-W><C-J>	"move to the split below
nnoremap <C-K> <C-W><C-K>	"move to the split above
nnoremap <C-L> <C-W><C-L>	"move to the split to the right
nnoremap <C-H> <C-W><C-H>	"move to the split to the left

" " Enable folding
" set foldmethod=indent
" set foldlevel=99

" " Enable folding with the spacebar
" nnoremap <space> za

" " python: PEP8 indentation
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

" " for other file types
" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2

" " Flagging unnecessary whitespaces
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" " UTF8 support
" set encoding=utf-8

" "python with virtualenv support
" " py << EOF
" " import os
" " import sys
" " if 'VIRTUAL_ENV' in os.environ:
" "   project_base_dir = os.environ['VIRTUAL_ENV']
" "   activate_this = os.path.join(project_base_dir, 'Scripts/activate_this.py')
" "   execfile(activate_this, dict(__file__=activate_this))
" " EOF

" " make code look pretty

" let python_highlight_all=1
" syntax on
" " --------------------------------------------------

" " Line Numbering
" set nu
" " --------------------------------------------------

" " System clipboard
" set clipboard=unnamed

" " Auto complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" " color scheme
" colorscheme pablo

" " fancy symbols; Powerline
" let g:Powerline_symbols = 'fancy'
