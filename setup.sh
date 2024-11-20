#!/bin/bash

# 安装 zsh
if ! command -v zsh &> /dev/null; then
  echo "安装 zsh..."
  brew install zsh
fi

# 安装 oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "安装 oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 安装 starship
if ! command -v starship &> /dev/null; then
  echo "安装 starship..."
  brew install starship
fi

# 安装 zsh 插件
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "安装 zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "安装 zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
  echo "安装 zsh-completions..."
  git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ]; then
  echo "安装 zsh-history-substring-search..."
  git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
fi

# 配置 .zshrc
cat << 'EOF' > ~/.zshrc
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8
# Disable Oh My Zsh themes as Starship is used.
# ZSH_THEME=""
# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-history-substring-search)
# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh
# Starship configuration
eval "$(starship init zsh)"
# Aliases
alias zshconfig="nano ~/.zshrc"
alias reload="source ~/.zshrc"
eval $(thefuck --alias)
EOF

# 安装 thefuck
if ! command -v thefuck &> /dev/null; then
  echo "安装 thefuck..."
  brew install thefuck
fi

# 配置 starship.toml
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

echo "配置完成，请重新启动终端或运行 'source ~/.zshrc' 以应用更改。"