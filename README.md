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

### Dependencies

- fzf
- ripgrep
- bat

### TODO

- spell check after nvim 0.8 release, info: https://github.com/lewis6991/spellsitter.nvim
- telescope does not show hidden files after ripgrep or fzf installation
- add more sources to cmp
- test new cmp and remove old
- figure out how exactly null-ls works
