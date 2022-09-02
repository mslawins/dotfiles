## Dotfiles

### Reproduction

1. Clone to home directory
2. Run:
   -- stow \*/ - to sync everything
   -- stow <dir_name> - to sync single config

### How it works

Stow creates links in parent directory (by default) to files in <dir_name>.

Example:

alacritty/.config/alacritty/.alacritty.yml is linked to ~/.config/alacritty/alacritty.yml
