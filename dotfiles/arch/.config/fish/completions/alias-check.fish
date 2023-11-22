complete -c alias-check -l edit -d 'Edit mode'

complete -c alias-check -a "(string split . (exa $HOME/.config/fish/functions/))"
