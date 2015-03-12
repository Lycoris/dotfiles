" ------------------------------------------
" Preamble
" ------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

filetype plugin indent on

" ------------------------------------------
" NeoBundle Plugin Management
" ------------------------------------------
NeoBundle 'LeafCage/nebula.vim'
NeoBundle 'taichouchou2/alpaca_powertabline'
"NeoBundle 'powerline/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundleLazy 'Shougo/vimshell', { 'depends' : [ 'Shougo/vimproc' ] }
NeoBundleLazy 'Shougo/vimfiler', { 'depends' : [ 'Shougo/unite.vim' ] }
NeoBundleLazy 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', { 'depends' : [ 'Shougo/unite.vim' ] }
NeoBundleLazy has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundleLazy 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'lervag/vim-latex'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', { 'depends' : [ 'tpope/vim-fugitive' ] }

" reference環境
NeoBundleLazy 'vim-ruby/vim-ruby', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'taka84u9/vim-ref-ri', { 'depends' : [ 'Shougo/unite.vim', 'thinca/vim-ref'] }
NeoBundleLazy 'skwp/vim-rspec', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }

NeoBundleLazy 'thinca/vim-ref'
NeoBundleLazy 'taglist.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundleLazy 'pentie/VimRepress'
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundleLazy 'mattn/gist-vim'
NeoBundleLazy 'mattn/emmet-vim'

" colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundleCheck

" ------------------------------------------
" Vim General Settings
" ------------------------------------------
" 256色設定
set t_Co=256
python sys.path.append('/usr/local/lib/python2.7/site-packages')  
python import markdown
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

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示

colorscheme molokai

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

endif

" tpope/vim-fugitive
if neobundle#tap('vim-fugitive')

  command Ga Gwrite
  command Gc Gcommit

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

endif

" Shougo/neocomplcache
if neobundle#tap('neocomplcache')

  call neobundle#config({
      \   'autoload' : {
      \     'insert' : 1,
      \   }
      \ })

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

endif

" lervag/vim-latex
if neobundle#tap('vim-latex')
  
  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'tex' ],
      \   }
      \ })

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

endif

" scrooloose/syntastic
if neobundle#tap('syntastic')
  let g:syntastic_tex_chktex_quiet_messages = { "level": "warnings" }
  let g:syntastic_tex_lacheck_quiet_messages = { "level": "warnings" }
endif

" vim-scripts/yanktmp.vim
if neobundle#tap('yanktmp.vim')
  map <silent> sy :call YanktmpYank(<CR>
  map <silent> sp :call YanktmpPaste_p(<CR>
  map <silent> sP :call YanktmpPaste_P(<CR>)))
endif

" tyru/open-browser.vim
if neobundle#tap('open-browser.vim')

  call neobundle#config({
      \   'autoload' : {
      \     'mappings' : '<Plug>(openbrowser-smart-search)',
      \     'commands' : [
      \       'OpenBrowserSmartSearch',
      \       'OpenBrowser',
      \     ]},
      \ })

  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  call neobundle#untap()

endif

" taka84u9/vim-ref-ri
if neobundle#tap('vim-ref-ri')

  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'ruby', 'eruby', 'haml' ]
      \   }
      \ })

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

endif

" mattn/emmet-vim
if neobundle#tap('emmet-vim')

  call neobundle#config({
      \   'autoload' : {
      \     'filetypes' : [ 'html', 'xhtml', 'php', 'css', 'xml', 'xls', 'markdown', 'erb' ],
      \   }
      \ })
  call neobundle#untap()

endif

" scrooloose/syntastic
if neobundle#tap('syntastic')

  call neobundle#config({
      \   'autoload' : {
      \     'insert' : 1,
      \   }
      \ })

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

" mattn/gist-vim
if neobundle#tap('gist-vim')

  call neobundle#config({
      \   'autoload' : {
      \     'commands' : [ "Gist" ]
      \   }
      \ })

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

