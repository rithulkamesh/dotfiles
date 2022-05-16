" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

let g:airline_theme='onedark'
"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
  hi Normal guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"}}}

"Language Specifics "{{{
" ----------------------------------------------------------------------

"Golang
filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"   
"}}}

" Discord Prescence "{{{
" ----------------------------------------------------------------------
  " General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"
"}}}


" vim: set foldmethod=marker foldlevel=0:
