" ------------------------------------------
" vim-plug Plugin Management
" ------------------------------------------
" vim-plug がなければ自動インストール
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ステータスライン
Plug 'itchyny/lightline.vim'

" カラースキーム
Plug 'tomasr/molokai'
Plug 'sainnhe/sonokai'

" LSP / 補完 (texlab等)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TeX
Plug 'lervag/vimtex'

" ファイル検索 / grep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" 編集支援
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'

" HTML/CSS
Plug 'mattn/emmet-vim'

" 日本語ヘルプ
Plug 'vim-jp/vimdoc-ja'

" スニペット
Plug 'honza/vim-snippets'

" TOML シンタックス
Plug 'cespare/vim-toml'

call plug#end()

filetype plugin indent on
syntax enable

" ------------------------------------------
" Vim General Settings
" ------------------------------------------
set t_Co=256
if executable('python3')
  let g:python3_host_prog = exepath('python3')
  let s:python3_prefix = system('python3 -c "import sys; print(sys.prefix)"')->trim()
  execute 'set pythonthreedll=' . s:python3_prefix . '/Python'
  execute 'set pythonthreehome=' . s:python3_prefix
endif

syntax on
set nobackup
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis,ucs-2
set fillchars+=stl:\ ,stlnc:\
set autoindent
set number
set incsearch
set ignorecase
set showmatch
set title
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set showtabline=2
set mouse=a
set ttymouse=sgr
set noswapfile
set wildmenu
set wildmode=longest:full,full
set noundofile
set splitright
set ambiwidth=single
set visualbell t_vb=
set noerrorbells
set clipboard=unnamed,autoselect

" 検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カラースキームの指定
autocmd ColorScheme sonokai highlight Comment ctermfg=242 guifg=#6b7089
colorscheme sonokai

" filetypeの追加設定
au BufNewFile,BufRead *.bbx :set filetype=tex
au BufNewFile,BufRead *.cbx :set filetype=tex
let g:tex_flavor='latex'

" ------------------------------------------
" Mappings (General)
" ------------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

nmap <Tab>      gt
nmap <S-Tab>    gT

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

nnoremap <Down> gj
nnoremap <Up>   gk

" ------------------------------------------
" lightline.vim
" ------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \ },
      \ }

" ------------------------------------------
" coc.nvim (LSP / 補完)
" ------------------------------------------
let g:coc_global_extensions = ['coc-snippets', 'coc-toml', 'coc-texlab', 'coc-vimtex']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" カーソル下のシンボルをハイライト
autocmd CursorHold * silent call CocActionAsync('highlight')

" K でドキュメント表示
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 補完メニューの操作
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" ------------------------------------------
" vimtex (TeX)
" ------------------------------------------
let g:vimtex_compiler_enabled = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_activate = 1
let g:vimtex_view_skim_sync = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
let g:vimtex_compiler_latexmk = {
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

" ------------------------------------------
" fzf.vim
" ------------------------------------------
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))

" ------------------------------------------
" vim-fugitive
" ------------------------------------------
command! Ga Gwrite
command! Gc Git commit
