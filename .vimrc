" ------------------------------------------
" Preamble
" ------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

" ------------------------------------------
" NeoBundle Plugin Management
" ------------------------------------------
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'powerline/powerline', { 'rtp' : 'powerline/bindings/vim'}
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle 'VimClojure'
NeoBundleLazy 'Shougo/vimshell', {
\ 'depends' : 'Shougo/vimproc',
\ 'autoload' : {
\   'commands' : [{ 'name' : 'VimShell',
\                   'complete' : 'customlist,vimshell#complete'},
\                 'VimShellExecute', 'VimShellInteractive',
\                 'VimShellTerminal', 'VimShellPop'],
\   'mappings' : ['<Plug>(vimshell_switch)']
\ }}
NeoBundleLazy 'Shougo/vimfiler', {
\   'depends' : ["Shougo/unite.vim"],
\   'autoload' : {
\       'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
\       'mappings' : ['<Plug>(vimfiler_switch)'],
\       'explorer' : 1,
\   }
\}
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload' : {
\       'commands' : [ "Unite", "UniteWithBufferDir", "UniteWithCurrentDir" ]
\   }
\}
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/svn-diff.vim'
NeoBundle 'janx/vim-rubytest'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'lervag/vim-latex'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'tpope/vim-fugitive'
command Ga Gwrite
command Gc Gcommit
NeoBundle 'gregsexton/gitv'
NeoBundle 'ujihisa/unite-gem'

" reference環境
NeoBundleLazy 'vim-ruby/vim-ruby', {
\ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'taka84u9/vim-ref-ri', {
\ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
\ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'skwp/vim-rspec', {
\ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', {
\ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }

NeoBundle 'thinca/vim-ref'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'taglist.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'pentie/VimRepress'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundleLazy 'basyura/twibill.vim'
NeoBundle 'yomi322/unite-tweetvim'
NeoBundleLazy 'mattn/gist-vim', {
\   'autoload' : {
\       'commands' : [ "Gist" ]
\   }
\}

" colorschemes
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'tomasr/molokai'

" ------------------------------------------
" Vim General Settings
" ------------------------------------------
set t_Co=256
filetype off
python sys.path.append('/usr/local/lib/python2.7/site-packages')  
python import markdown
filetype plugin indent on
" シンタックスハイライトを有効にする
syntax on 
" バックアップファイルを作らない設定にする
set nobackup 
" デフォルトの文字コード
set encoding=utf-8 
" 自動判別に使用する文字コード
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis,ucs-2 
set fillchars+=stl:\ ,stlnc:\
" GVim用フォント設定
set guifont=Monaco\ for\ Powerline:h12
set guifontwide=Monaco\ for\ Powerline:h12
" オートインデントする
set autoindent 
" 行番号を表示する
set number 
" インクリメンタルサーチ
set incsearch 
" 検索時に大文字小文字を無視する
set ignorecase 
" 対応する括弧のハイライト表示する
set showmatch 
" 編集中のファイル名を表示する
set title 
" ルーラーの表示する
set ruler 
" タブ文字数を2にする
set tabstop=2 
set shiftwidth=2
set expandtab
set laststatus=2
set showtabline=2
set mouse=a
set ttymouse=xterm2
set noswapfile
set wildmenu
set wildmode=longest:full,full
set noundofile
set splitright

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示

colorscheme molokai
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:unite_force_overwrite_statusline = 0

let g:quickrun_config = {
\ 'tex' : {
\   'command' : 'latexmk',
\	'cmdopt' : '-pdfdvi',
\   'exec': ['%c %o %s']}
\ }
let g:quickrun_config['_'] = {
\   'runner' : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\}

" ------------------------------------------
" Mappings
" ------------------------------------------
nnoremap <expr><silent> <C-c> quickrun#is_running( ? quickrun#sweep_sessions( : "\<C-c>"))

imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" 挿入モードでのカーソル移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

nmap <Tab>      gt
nmap <S-Tab>    gT

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space>t :TweetVimSay<CR>
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=30 -toggle -auto-cd -no-quit -simple<Cr>
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
endfunction

" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
" unite.vim keymap"
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>"

" ------------------------------------------
" Plugin Settings
" ------------------------------------------

" lervag/vim-latex
let g:latex_latexmk_enabled = 1
let g:latex_latexmk_options = '-pdfdvi'
let g:latex_view_method = 'general'
let g:latex_view_general_viewer = 'open'
let g:latex_fold_sections = [
      \ "part",
      \ "chapter",
      \ "section",
      \ "subsection",
      \ "subsubsection",
      \ ]
let g:latex_fold_enabled = 1
let g:latex_latexmk_continuous = 1
let g:latex_latexmk_background = 1
let g:latex_latexmk_callback = 0
let g:latex_quickfix_ignore_all_warnings = 0

" Shougo/vimfiler
autocmd! FileType vimfiler call s:my_vimfiler_settings()
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_force_overwrite_statusline = 0

" Shougo/neocomplete or Shougo/neocomplcache
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#min_syntax_length = 3
  let g:neocomplete#auto_completion_start_length = 3
  let g:neocomplete#enable_camel_case_completion = 1
  let g:neocomplete#enable_quick_match = 1
  let g:neocomplete#force_overwrite_completefunc = 1
  let g:neocomplete#enable_auto_select = 1
elseif neobundle#is_installed('neocomplcache')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_auto_completion_start_length = 3
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplcache_enable_quick_match = 1
  let g:neocomplcache_enable_auto_select = 1
endif

