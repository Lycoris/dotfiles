set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

	NeoBundle 'Shougo/neobundle.vim'
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
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'jpalardy/vim-slime'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'hrp/EnhancedCommentify'
	NeoBundle 'vim-scripts/yanktmp.vim'
	NeoBundle 'tsaleh/vim-matchit'
	NeoBundle 'vim-scripts/svn-diff.vim'
	NeoBundle 'janx/vim-rubytest'
	NeoBundle 'tomasr/molokai'
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
	NeoBundle 'nanotech/jellybeans.vim'
	NeoBundle 'mrkn/mrkn256.vim'
	NeoBundle 'cocopon/iceberg.vim'
	NeoBundle 'edkolev/tmuxline.vim'
	NeoBundle 'taglist.vim'
	NeoBundle 'glidenote/memolist.vim'
	NeoBundle 'fuenor/qfixgrep'
	NeoBundle 'vim-jp/vital.vim'
	NeoBundle 'pentie/VimRepress'
	NeoBundle 'tyru/open-browser.vim'
	NeoBundleLazy 'basyura/twibill.vim'
	NeoBundleLazy 'basyura/TweetVim', 'dev', {
	\   'depends' : ['basyura/twibill.vim', 'tyru/open-browser.vim' ],
	\   'autoload' : {
	\       'commands' : [ "TweetVimHomeTimeline", "TweetVimSay", "TweetVimUserStream", "TweetVimUserTimeline" ]
	\   }
	\}
	NeoBundle 'yomi322/unite-tweetvim'
	NeoBundle 'yuratomo/gmail.vim'
	NeoBundle 'qtmplsel.vim'
	NeoBundleLazy 'mattn/gist-vim', {
	\   'autoload' : {
	\       'commands' : [ "Gist" ]
	\   }
	\}


	filetype plugin indent on
	filetype indent on
syntax on "シンタックスハイライトを有効にする
set nobackup "バックアップファイルを作らない設定にする
set encoding=utf-8 "デフォルトの文字コード
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis "自動判別に使用する文字コード 
set autoindent "オートインデントする
set number "行番号を表示する
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視する
set showmatch "対応する括弧のハイライト表示する
set showmode "モード表示する
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
set tabstop=4 "タブ文字数を4にする
set laststatus=2
set mouse=a
set ttymouse=xterm2
set noswapfile
set wildmenu
set wildmode=longest:full,full

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示

colorscheme mrkn256
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:airline#extensions#tabline#enabled = 1
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
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


map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space>t :TweetVimSay<CR>


let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:Tex_AutoFolding = 1
let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 --interaction=nonstopmode $*'


let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor='latex'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:memolist_path = "$HOME/Dropbox/Memo"
let g:memolist_memo_date = "%Y/%m/%d %H:%m"
let g:memolist_vimfiler = 1
let g:memolist_qfixgrep = 1



