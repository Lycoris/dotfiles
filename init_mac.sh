#!/bin/bash
# https://github.com/hokariyutaka/dotfiles/blob/master/init_mac.sh
# https://github.com/keyamin/dotfiles/blob/main/mac/setup.sh
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh

# 各種設定、すべての設定反映には再起動がベスト
# Dock
## Dockのサイズ
defaults write com.apple.dock tilesize -int 60
## Dockの拡大サイズ
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 100
## 最近起動したアプリを非表示
defaults write com.apple.dock show-recents -bool false
## ウインドウをしまうときのエフェクト
defaults write com.apple.dock mineffect -string "genie"
## Dock を自動的に隠す
defaults write com.apple.dock autohide -bool true
## ダブルクリックでウインドウの最小化
defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"
## Dockの設定反映
killall cfprefsd
killall Dock

# Finder
## 拡張子まで表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
## Finderの設定反映
killall Finder

# 言語と地域
## 週の始まりは日曜日
defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 1
## 24時間表示
defaults delete .GlobalPreferences AppleICUForce12HourTime
## 温度は摂氏表示
defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"
## リストの表示順は日本語
defaults write .GlobalPreferences AppleCollationOrder -string "ja"

# Battery
## バッテリーを%表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# キーボード
## キーのリピート速度
defaults write NSGlobalDomain KeyRepeat -int 6
## キーのリピート認識時間
defaults write NSGlobalDomain InitialKeyRepeat -int 68

# Trackpad
## タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -bool true
## 軌跡の速さ
defaults write -g com.apple.trackpad.scaling 2
## スクロールの方向
defaults write .GlobalPreferences com.apple.swipescrolldirection -bool true

# その他の設定
## ネットワーク接続したディレクトリに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## 自動で頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
## スペルの訂正を無効にする
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
## スクリーンセーバーを開始しない
defaults -currentHost write com.apple.screensaver idleTime -int 0


# Homebrew
if !(type "brew" >/dev/null 2>&1); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Run brew doctor..."
  brew doctor
  echo "Updating Homebrew..."
  brew update && brew upgrade
else 
  echo "Homebrew is already installed"
fi

# Rosettaのインストール
sudo softwareupdate --install-rosetta --agree-to-license

# Brewfileからアプリケーションのインストール
echo "Installing Applications..."
brew bundle --global
chsh -s /usr/local/bin/zsh
echo "All Done! Let's get started!"

