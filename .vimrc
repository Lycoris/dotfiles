" ------------------------------------------
" Dein.vim Plugin Management
" (https://qiita.com/delphinus/items/00ff2c0ba972c6e41542)
" (https://qiita.com/kawaz/items/ee725f6214f91337b42b)
" ------------------------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif

" もし、未インストールものものがあったらインストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

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
" テキストの自動改行をオフ
" set formatoptions=q
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
set ttymouse=sgr
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
let g:tex_flavor='tex'

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

