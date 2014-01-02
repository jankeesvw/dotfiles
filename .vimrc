" vim:fdm=marker
set nocompatible                  " Must come first because it changes other options.
filetype off                      " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set clipboard=unnamed             " Use system clipboard

runtime macros/matchit.vim        " Load the matchit plugin.

let mapleader=" "                 " Set <leader>

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set colorcolumn=80,105,115        " mark the 80th character, and (old and new) github code window width

set hidden                        " Handle multiple buffers better (it hides closed buffers)

set mouse=a                       " Enable mouse (yes, i'm commiting a VIM sin)

set history=1000                  " remember more commands and search history
set undolevels=1000               " remember what to undo

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time

" statusline configuration {{{
set statusline=[%c,%l/%L]                       " show current position and line count as: [column,current/total]
set statusline+=%{&readonly?'\ [READ-ONLY]':''} " show readonly indicator
set statusline+=%{&readonly&&&modified?'\ ':''} " need to add an extra space for some reason, when both true
set statusline+=%{&modified?'\ ':''}            " show modified indicator
set statusline+=%#modified#
set statusline+=%{&modified?'\[MODIFIED]':''}   " show modified indicator
set statusline+=%*
set statusline+=\ %y                            " show file type
set statusline+=\ [%t]                          " show file name
set statusline+=\ %#warningmsg#                 " change the color to red
set statusline+=%*                              " reset color
set statusline+=%=                              " align on the right
set statusline+=\ %{fugitive#statusline()}      " show git status
" }}}

" Colorscheme: {{{
Bundle 'nanotech/jellybeans.vim'
if &t_Co > 2 || has('gui_running')
  syntax on
endif
if &t_Co == 256 || has('gui_running')
  set t_Co=256
  let g:jellybeans_background_color_256=0 " truly black background
  colorscheme jellybeans

  highlight VertSplit    ctermbg=16  ctermfg=233
  highlight LineNr       ctermfg=237 ctermbg=0
  highlight TabLineFill  ctermbg=16  ctermfg=236 cterm=underline
  highlight TabLine      ctermbg=16  ctermfg=236 cterm=underline
  highlight TabLineSel   ctermbg=234 ctermfg=255
  highlight StatusLine   ctermbg=234 ctermfg=255
  highlight StatusLineNC ctermbg=233 ctermfg=244

  highlight ColorColumn  ctermbg=233
  highlight IndentGuidesOdd  ctermbg=233
  highlight IndentGuidesEven ctermbg=16
  highlight clear SignColumn
endif
"}}}

" Syntax: Highlighters, Indenters, etc... {{{
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'nono/vim-handlebars'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'

Bundle 'vim-ruby/vim-ruby'
let ruby_space_errors = 1
let g:ruby_indent_access_modifier_style = 'outdent'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_indent_levels = 6
"}}}

Bundle 'tpope/vim-rails'
Bundle 'lmeijvogel/vim-yaml-helper'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jgdavey/vim-turbux'

" Tmux {{{ 
Bundle 'benmills/vimux'
" }}}

" Switch: {{{
Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>
"}}}

" Ruby: Rspec runner Integration {{{
Bundle 'thoughtbot/vim-rspec'

Bundle 'tpope/vim-dispatch' 
let g:rspec_command='Dispatch ./bin/rspec {spec}'

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"}}}

" Custom commands
command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

function! RunInVimux(command)
  let _ = VimuxOpenPane()
  let _ = VimuxSendText(a:command)
endfunction

" Edit vimrc
command Vimrc execute "e ~/dotfiles/.vimrc"
command ShowWhiteSpace execute "set list | :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<"
command Gitx execute "Silent gitx"

" Grep config {{{
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

" Project shortcuts {{{
command Timi execute "cd ~/Documents/timi/timi/"
command Workaway execute "cd ~/Documents/workaway/"
" }}}

" Custom remap
" nerdtree toggle
map <C-n> :NERDTreeToggle<cr>
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>

" save file with <space><space>
noremap <space><space> :w<CR>   
" Show blame for visual selection
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" Auto format file
nnoremap <Leader>f gg=G<CR>

" ctrl-p {{{
Bundle 'kien/ctrlp.vim'
let g:ctrlp_max_depth = 10
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\^.git|\.hg$\|\.svn$|^vendor$|^coverage$|^tmp$|^rdoc$|',
  \ 'file': '\.png$\|\.jpg$\|\.gif$|\.DS_Store',
  \ }
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
"}}}

" nerdtree toggle {{{
map <C-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close when NERDtree is the last window
" toggle nerdtree with the cursor positioned at the current file
nmap <C-N> :NERDTreeFind<cr>
"}}}

" Do not remap some keys to make window navigation easier {{{
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}
