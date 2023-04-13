set fish_greeting
pfetch

set fish_user_paths $fish_user_paths $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin /opt/cuda/bin $HOME/.cargo/bin $HOME/.dotnet/tools /usr/share/dotnet $HOME/.local/bin

set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x PF_INFO "ascii title os wm editor shell uptime pkgs memory palette"

set -x _CONDA_ROOT "/home/winston/miniconda3"
eval /home/winston/miniconda3/bin/conda "shell.fish" "hook" $argv | source

conda activate default
starship init fish | source
