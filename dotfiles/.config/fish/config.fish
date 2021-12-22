set fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

set -x PF_INFO "ascii title os wm editor shell uptime pkgs memory palette"

eval /home/winston/miniconda3/bin/conda "shell.fish" "hook" $argv | source

pfetch
starship init fish | source

