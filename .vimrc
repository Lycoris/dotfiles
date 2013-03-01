set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
	endif
	" originalrepos on github
	NeoBundle 'Shougo/neobundle.vim'
	NeoBundle 'Shougo/vimproc'
	NeoBundle 'VimClojure'
	NeoBundle 'Shougo/vimshell'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'jpalardy/vim-slime'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'hrp/EnhancedCommentify'
	NeoBundle 'vim-scripts/yanktmp.vim'
	NeoBundle 'tsaleh/vim-matchit'
	NeoBundle 'vim-scripts/svn-diff.vim'
	NeoBundle 'janx/vim-rubytest'
	NeoBundle 'vim-ruby/vim-ruby'
	"  NeoBundle 'https://bitbucket.org/kovisoft/slimv'
	
	filetype plugin indent on     " required!
	filetype indent on
syntax on "シンタックスハイライトを有効にする
set nobackup "バックアップファイルを作らない設定にする
set encoding=utf-8 "デフォルトの文字コード
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis "自動判別に使用する文字コード 
set autoindent "オートインデントする
set number "行番号を表示する
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視する
set showmatch "対応する括弧のハイライト表示する
set showmode "モード表示する
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
set tabstop=4 "タブ文字数を4にする
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/" 全角スペースの表示
colorscheme molokai "/usr/share/vim/vim72/colors or ~/.vim/colors

imap {} {}<Left>  
imap [] []<Left>  
imap () ()<Left>  
imap "" ""<Left>  
imap '' ''<Left>  
imap <> <><Left>  
