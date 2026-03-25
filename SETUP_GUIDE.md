# iMac セットアップ手順

dotfiles を git pull した後に手動で行う作業のまとめ。

## 1. Homebrew パッケージのインストール

```bash
brew update && brew upgrade
brew bundle --global
```

これで sheldon, fzf, mise, eza, bat, ripgrep, zoxide, macvim-app 等が入る。

## 2. sheldon (zsh プラグイン管理)

```bash
mkdir -p ~/.config
ln -snf ~/dotfiles/.config/sheldon ~/.config/sheldon
sheldon lock
```

## 3. .gitconfig の生成

.gitconfig はリポジトリから除外されたので、テンプレートから生成する。

```bash
sed -e "s/{{GIT_USER_NAME}}/あなたのユーザー名/" \
    -e "s/{{GIT_USER_EMAIL}}/あなたのメールアドレス/" \
    ~/dotfiles/.gitconfig.template > ~/.gitconfig
```

または `install.sh` を実行すれば対話的に入力できる。

## 4. mise (Node.js 等のバージョン管理)

```bash
mise use --global node@22
```

旧ツールが残っている場合は削除:

```bash
brew uninstall nodebrew 2>/dev/null
rm -rf ~/.nodebrew ~/.nvm
```

## 5. MacVim (vim-plug)

MacVim を起動し、以下を実行:

```vim
:PlugInstall
```

旧 dein のキャッシュが残っている場合は削除してよい:

```bash
rm -rf ~/.vim/dein
```

## 6. zplug の削除 (任意)

sheldon に移行済みなので不要:

```bash
rm -rf ~/.zplug
```

## 7. macvim-app の注意

cask 名が `macvim` → `macvim-app` に変わっている。古い macvim のバイナリが `/opt/homebrew/bin/` に残っているとインストールに失敗するので、その場合は手動で削除してから再インストール:

```bash
brew uninstall --formula macvim 2>/dev/null
brew install --cask macvim-app
```

## 8. Claude Code (AI コーディングアシスタント)

スタンドアロン版をインストール:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

npm 版が入っている場合は削除:

```bash
npm uninstall -g @anthropic-ai/claude-code
```

## 9. iTerm2 のフォント設定

`brew bundle` で Hack Nerd Font がインストールされる。eza のアイコンや Powerlevel10k のグリフを正しく表示するために、iTerm2 のフォントを変更する:

1. iTerm2 → `Preferences` → `Profiles` → `Text`
2. `Font` を **Hack Nerd Font** に変更

## 確認

すべて完了したら新しいシェルを開いて動作確認:

```bash
source ~/.zshrc
eza --version    # ファイル一覧ツール
bat --version    # cat 代替
rg --version     # grep 代替
z --help         # スマート cd (使い始めは学習中なのでまだ飛べない)
fzf --version    # あいまい検索 (Ctrl+R で履歴検索)
mise --version   # バージョン管理
sheldon --version
claude --version   # AI コーディングアシスタント
```
