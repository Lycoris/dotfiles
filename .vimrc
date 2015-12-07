" ------------------------------------------
" Preamble
" ------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" ------------------------------------------
" NeoBundle Plugin Management
" ------------------------------------------
call neobundle#begin(expand('~/.vim/bundle/'))

" Shougo/NeoBundle
if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'taichouchou2/alpaca_powertabline'
  NeoBundle 'Shougo/vimproc.vim'
  call neobundle#config('vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    }})
  NeoBundle 'Shougo/unite.vim', { 'depends' : [ 'Shougo/neomru.vim', 'Shougo/vimproc.vim' ] }
  NeoBundle 'Shougo/unite-sudo'
  "NeoBundle 'hrp/EnhancedCommentify'
  NeoBundle 'vim-scripts/yanktmp.vim'
  NeoBundle 'vim-scripts/sudo.vim'
  NeoBundle 'tpope/vim-repeat'
  "NeoBundle 'fuenor/qfixgrep'
  "NeoBundle 'mattn/webapi-vim'

  " colorscheme
  NeoBundle 'tomasr/molokai'

  NeoBundleLazy 'vim-jp/vimdoc-ja'
  NeoBundleLazy 'Shougo/vimshell', { 'depends' : [ 'Shougo/vimproc.vim' ] }
  NeoBundleLazy 'Shougo/vimfiler', { 'depends' : [ 'Shougo/unite.vim' ] }
  NeoBundleLazy 'Shougo/neomru.vim'
  NeoBundleLazy 'Shougo/neocomplete'
  "NeoBundleLazy has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
  NeoBundleLazy 'Shougo/neosnippet', { 'depends' : 'Shougo/neosnippet-snippets' }
  NeoBundleLazy 'Shougo/neosnippet-snippets'
  NeoBundleLazy 'Shougo/unite-help'
  NeoBundleLazy 'scrooloose/syntastic'
  NeoBundleLazy 'thinca/vim-quickrun'
  NeoBundleLazy 'lervag/vimtex'
  NeoBundleLazy 'tpope/vim-surround'
  NeoBundleLazy 'tpope/vim-fugitive'
  NeoBundleLazy 'gregsexton/gitv', { 'depends' : [ 'tpope/vim-fugitive' ] }
  NeoBundleLazy 'LeafCage/nebula.vim'

  " reference環境
  NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'taka84u9/vim-ref-ri', { 'depends' : [ 'Shougo/unite.vim', 'thinca/vim-ref'] }
  NeoBundleLazy 'skwp/vim-rspec', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'ruby-matchit', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }

  NeoBundleLazy 'thinca/vim-ref'
  NeoBundleLazy 'taglist.vim'
  NeoBundleLazy 'pentie/VimRepress'
  NeoBundleLazy 'mattn/emmet-vim'


  NeoBundleSaveCache
endif

" ------------------------------------------
" Plugin Settings
" ------------------------------------------
" Shougo/vimfiler
if neobundle#tap('vimfiler')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
      \     'mappings' : ['<Plug>(vimfiler_switch)'],
      \     'explorer' : 1,
      \   }
      \ })

  nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=30 -toggle -auto-cd -no-quit -simple<Cr>
  function! s:my_vimfiler_settings()
    nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  endfunction
  autocmd! FileType vimfiler call s:my_vimfiler_settings()
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_edit_action = 'tabopen'
  let g:vimfiler_force_overwrite_statusline = 0
  let g:vimfiler_data_directory = expand('~/.vim/etc/vimfiler')

  call neobundle#untap()
endif

" Shougo/unite.vim
if neobundle#tap('unite.vim')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [ "Unite", "UniteWithBufferDir", "UniteWithCurrentDir" ]
      \   }
      \ })

  nnoremap    [unite]   <Nop>
  nmap    <Leader>f [unite]
  " https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
  nnoremap [unite]u  :<C-u>Unite -no-split<Space>
  nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
  nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
  nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
  nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
  nnoremap <silent> ,vr :UniteResume<CR>"

  let g:unite_force_overwrite_statusline = 0

  call neobundle#untap()
endif

" thinca/vim-quickrun
if neobundle#tap('vim-quickrun')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : 'QuickRun',
      \     'mappings' : '[<Plug>(quickrun)]',
      \   }
      \ })

  nnoremap <expr><silent> <C-c> quickrun#is_running( ? quickrun#sweep_sessions( : "\<C-c>"))
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

  call neobundle#untap()
endif

" tpope/vim-fugitive
if neobundle#tap('vim-fugitive')

  command Ga Gwrite
  command Gc Gcommit

  call neobundle#untap()
endif

" Shougo/neocomplete
if neobundle#tap('neocomplete')

  call neobundle#config({
      \   'autoload' : {
      \     'insert' : 1,
      \   }
      \ })

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
  let g:neocomplete#data_directory = expand('~/.vim/etc/neocomplete')

  call neobundle#untap()
endif

" Shougo/neocomplcache
" if neobundle#tap('neocomplcache')
" 
"   call neobundle#config({
"       \   'autoload' : {
"       \     'insert' : 1,
"       \   }
"       \ })
" 
"   let g:neocomplcache_enable_at_startup = 1
"   let g:neocomplcache_enable_ignore_case = 1
"   let g:neocomplcache_enable_smart_case = 1
"   let g:neocomplcache_enable_underbar_completion = 1
"   let g:neocomplcache_min_syntax_length = 3
"   let g:neocomplcache_auto_completion_start_length = 3
"   let g:neocomplcache_enable_camel_case_completion = 1
"   let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"   let g:neocomplcache_enable_quick_match = 1
"   let g:neocomplcache_enable_auto_select = 1
" 
"   call neobundle#untap()
" endif

" Shougo/neosnippet
if neobundle#tap('neosnippet')

  call neobundle#config({
      \   'autoload' : {
      \     'insert' : 1,
      \     'filetype' : 'snippet',
      \     'commands' : [ "NeoSnippetEdit", "NeoSnippetSource" ],
      \     'filetypes' : [ 'nsnippet' ],
      \     'unite_sources' : [ 'snippet', 'neosnippet/user', 'neosnippet/runtime' ]
      \   }
      \ })

  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  let g:neosnippet#data_directory     = expand('~/.vim/etc/.cache/neosnippet')
  let g:neosnippet#snippets_directory = [expand('~/.vim/bundle/neosnippet-snippets/neosnippets'),expand('~/.vim/snippets')]

  call neobundle#untap()
endif

" lervag/vimtex
if neobundle#tap('vimtex')
  
  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'tex' ],
      \   }
      \ })

  let g:vimtex_latexmk_enabled = 1
  let g:vimtex_latexmk_options = '-pdfdvi'
  let g:vimtex_view_method = 'general'
  let g:vimtex_view_general_viewer = 'open'
  let g:vimtex_fold_sections = [
        \ "part",
        \ "chapter",
        \ "section",
        \ "subsection",
        \ "subsubsection",
        \ ]
  let g:vimtex_fold_enabled = 1
  let g:vimtex_latexmk_continuous = 1
  let g:vimtex_latexmk_background = 1
  let g:vimtex_latexmk_callback = 0
  let g:vimtex_quickfix_ignore_all_warnings = 0

  call neobundle#untap()
endif

" scrooloose/syntastic
if neobundle#tap('syntastic')
  let g:syntastic_tex_chktex_quiet_messages = { "level": "warnings" }
  let g:syntastic_tex_lacheck_quiet_messages = { "level": "warnings" }

  call neobundle#untap()
endif

" vim-scripts/yanktmp.vim
if neobundle#tap('yanktmp.vim')
  map <silent> sy :call YanktmpYank(<CR>
  map <silent> sp :call YanktmpPaste_p(<CR>
  map <silent> sP :call YanktmpPaste_P(<CR>)))

  call neobundle#untap()
endif

" taka84u9/vim-ref-ri
if neobundle#tap('vim-ref-ri')

  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'ruby', 'eruby', 'haml' ]
      \   }
      \ })

  call neobundle#untap()
endif

" Shougo/vimshell
if neobundle#tap('vimshell')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [{ 'name' : 'VimShell',
      \                     'complete' : 'customlist,vimshell#complete'},
      \                     'VimShellExecute', 'VimShellInteractive',
      \                     'VimShellTerminal', 'VimShellPop'],
      \     'mappings' : ['<Plug>(vimshell_switch)']
      \   }
      \ })

  let g:vimshell_temporary_directory  = expand('~/.vim/etc/VimShell')

  call neobundle#untap()
endif

" mattn/emmet-vim
if neobundle#tap('emmet-vim')

  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'html', 'xhtml', 'php', 'css', 'xml', 'xls', 'markdown', 'erb' ],
      \   }
      \ })
  call neobundle#untap()

  call neobundle#untap()
endif

" scrooloose/syntastic
if neobundle#tap('syntastic')

  call neobundle#config({
      \   'autoload' : {
      \     'insert' : 1,
      \   }
      \ })

  call neobundle#untap()
endif

" tpope/vim-fugitive
if neobundle#tap('vim-fugitive')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [
      \       'Gstatus', 'Gcommit', 'Gwrite', 'Gdiff', 'Gblame', 'Git', 'Ggrep'
      \     ]
      \   }
      \ })

  call neobundle#untap()
endif

" gregsexton/gitv
if neobundle#tap('gitv')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [ 'Gitv' ]
      \   }
      \ })

  call neobundle#untap()
endif

" pentie/VimRepress
if neobundle#tap('VimRepress')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [
      \       'BlogNew', 'BlogList'
      \     ],
      \   }
      \ })

  call neobundle#untap()
endif

" LeafCage/nebula.vim
if neobundle#tap('nebula.vim')

  function! neobundle#tapped.hooks.on_source(bundle)
  endfunction

  call neobundle#config('nebula.vim',
        \ {'autoload': {'commands': ['NebulaPutLazy', 'NebulaPutFromClipboard', 'NebulaYankOptions', 'NebulaYankConfig', 'NebulaPutConfig', 'NebulaYankTap']}})

  call neobundle#untap()
endif

call neobundle#end()

filetype plugin indent on

if !has('vim_starting')
  NeoBundleCheck
endif

" ------------------------------------------
" Vim General Settings
" ------------------------------------------
" 256色設定
set t_Co=256
python sys.path.append('/usr/local/lib/python2.7/site-packages')  
" シンタックスハイライトを有効にする
syntax on 
" バックアップファイルを作らない設定にする
set nobackup 
" デフォルトの文字コード
set encoding=utf-8 
" 自動判別に使用する文字コード
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
" 見た目のタブ文字数を2にする
set tabstop=2 
" autoindentの際に挿入される幅
set shiftwidth=2
" タブの入力を空白文字に置き換える
set expandtab
" ステータスラインを常時表示
set laststatus=2
" タブバーを常時表示
set showtabline=2
" マウスを有効にする
set mouse=a
set ttymouse=xterm2
" スワップファイルを作らない
set noswapfile
" exモードの補完
set wildmenu
set wildmode=longest:full,full
" http://www.kaoriya.net/blog/2014/03/30/
set noundofile
" splitする時には右側に新しいウインドウを開く
set splitright
" 記号とかでカーソルがずれないようにする
set ambiwidth=single
" ビープ音を鳴らさない
set visualbell t_vb=
set noerrorbells
" 検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz
" ヤンクをクリップボードへコピー
set clipboard=unnamed,autoselect

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示

" カラースキームの指定
colorscheme molokai

" filetypeの追加設定
au BufNewFile,BufRead *.bbx :set filetype=tex
au BufNewFile,BufRead *.cbx :set filetype=tex
let g:tex_flavor = 'tex'

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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

