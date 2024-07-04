set fish_greeting
set fish_user_paths $fish_user_paths
set -x PF_INFO "ascii title os wm editor shell uptime pkgs memory palette"

set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT "-c"

eval $HOME/mambaforge/bin/conda "shell.fish" "hook" $argv | source
source $HOME/mambaforge/etc/fish/conf.d/mamba.fish

pfetch
starship init fish | source
zoxide init fish | source