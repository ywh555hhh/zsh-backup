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