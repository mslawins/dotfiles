## Dotfiles

### Reproduction

1. Clone to home directory
2. Run:

- stow \*/ - to sync everything
- stow <dir_name> - to sync single config

### How it works

Stow creates links in parent directory (by default) to files in <dir_name>.

Example:

alacritty/.config/alacritty/.alacritty.yml is linked to ~/.config/alacritty/alacritty.yml

### TODO

- spell check after nvim 0.8 release, info: https://github.com/lewis6991/spellsitter.nvim
- Rust go to definition does not work
- telescope does not show hidden files
- add more sources to cmp
- test new cmp and remove old
- remap ctrl + u in zellij to allow for standard vim bind
