# path to  oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# exports
export TERM=xterm
export EDITOR=nvim

# adds custom location with themes & set up theme
ZSH_CUSTOM=./.zsh_config/
ZSH_THEME="uncharted"

# here goes plugins
plugins=(extract # easy archive extraction: extract foo.zip
         colored-man-pages
         
         # suggest package name when not found
         command-not-found 

         # general
         git
         docker
         
         # js ecosystem
         node
         npm
         nvm
         
         # rust
         rust

         # mac
         brew
         macos
         )

source ~/.oh-my-zsh/oh-my-zsh.sh
source ./.zsh_config/aliases.cfg

# node version manager script 
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
