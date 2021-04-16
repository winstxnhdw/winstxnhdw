#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias autoremove='sudo pacman -Rnsc $(pacman -Qdtq)'
alias cleanvim='rm -rf ~/.cache/vim/swap/*'
