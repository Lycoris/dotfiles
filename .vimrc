set nocompatible
set t_Co=256
filetype off
python sys.path.append('/usr/local/lib/python2.7/site-packages')  
python import markdown

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

	NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'alpaca-tc/alpaca_powertabline'
  NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
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
  if neobundle#is_installed('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_underbar_completion = 1
    let g:neocomplete#min_syntax_length = 3
    let g:neocomplete#auto_completion_start_length = 3
    let g:neocomplete#enable_camel_case_completion = 1
    let g:neocomplete#enable_quick_match = 1
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
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'jpalardy/vim-slime'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'hrp/EnhancedCommentify'
	NeoBundle 'vim-scripts/yanktmp.vim'
	"NeoBundle 'tsaleh/vim-matchit'
	NeoBundle 'vim-scripts/svn-diff.vim'
	NeoBundle 'janx/vim-rubytest'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'jcf/vim-latex'
	NeoBundle 'itchyny/calendar.vim'
	NeoBundle 'bling/vim-airline'
	NeoBundle 'rcmdnk/vim-markdown'
	NeoBundle 'vim-scripts/sudo.vim'
	NeoBundle 'ujihisa/ref-hoogle'
	NeoBundle 'vim-scripts/grep.vim'
	NeoBundle 'tpope/vim-fugitive'
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
	NeoBundle 'taglist.vim'
	NeoBundle 'fuenor/qfixgrep'
	NeoBundle 'vim-jp/vital.vim'
	NeoBundle 'pentie/VimRepress'
	NeoBundle 'mattn/webapi-vim'
	NeoBundle 'tyru/open-browser.vim'
	NeoBundleLazy 'basyura/twibill.vim'
	NeoBundle 'yomi322/unite-tweetvim'
  "NeoBundle 'qtmplsel.vim'
	NeoBundleLazy 'mattn/gist-vim', {
	\   'autoload' : {
	\       'commands' : [ "Gist" ]
	\   }
	\}
  NeoBundle 'kakkyz81/evervim'
let g:evervim_devtoken ='S=s20:U=203711:E=14de0828269:C=14688d1566d:P=1cd:A=en-devtoken:V=2:H=33eda0319b804dbe6913961b538a6fe9'
let g:evervim_usemarkdown = 0 

filetype plugin indent on
filetype indent on
syntax on "シンタックスハイライトを有効にする
set nobackup "バックアップファイルを作らない設定にする
set encoding=utf-8 "デフォルトの文字コード
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis,ucs-2 "自動判別に使用する文字コード 
set autoindent "オートインデントする
set number "行番号を表示する
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視する
set showmatch "対応する括弧のハイライト表示する
set showmode "モード表示する
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
set tabstop=2 "タブ文字数を4にする
set shiftwidth=2
set expandtab
set laststatus=2
set mouse=a
set ttymouse=xterm2
set noswapfile
set wildmenu
set wildmode=longest:full,full
set noundofile

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示

colorscheme mrkn256
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:airline#extensions#tabline#enabled = 1
let g:unite_force_overwrite_statusline = 0
let g:gmail_user_name = 'some.chicken@gmail.com'
let g:gmail_signature = ''

"let g:quickrun_config = {
"\ 'tex' : {
"\   'command' : 'latexmk',
"\	'cmdopt' : '-dvi',
"\   'exec': ['%c %s']}
"\ }
"let g:quickrun_config['_'] = {
"\   'runner' : 'vimproc',
"\   'runner/vimproc/updatetime' : 100,
"\}


let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#H',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '',
      \'y'    : '',
      \'z'    : '%Y/%m/%d(%a) %H:%M:%S'}
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '>',
    \ 'left_alt': '|',
    \ 'right' : '<',
    \ 'right_alt' : '|',
    \ 'space' : ' '}


imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nmap <Tab>      gt
nmap <S-Tab>    gT

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space>t :TweetVimSay<CR>
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=30 -toggle -auto-cd -no-quit -simple<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
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




let g:Tex_AutoFolding = 1
let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 --interaction=nonstopmode $*'


let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor='latex'

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_force_overwrite_statusline = 0


