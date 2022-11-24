plugins=(
         git
         docker
         docker-compose
         
         node
         npm
         
         rust

         brew
         macos
         )

export TERM=xterm
export EDITOR=nvim
export ZSH=~/.oh-my-zsh
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

ZSH_CUSTOM=~/.zsh_config/
ZSH_THEME="uncharted"

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zsh_config/aliases.cfg

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/msw/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end