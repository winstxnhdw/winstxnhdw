set fish_greeting
set fish_user_paths $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $fish_user_paths
set -x PF_INFO "ascii title os wm editor shell uptime pkgs memory palette"

set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

starship init fish | source
