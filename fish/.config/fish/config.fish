set local_config "$HOME/.local-config"
if test -f "$local_config"
	source "$local_config"
end

set -g fish_greeting
fish_config theme choose Nord

starship init fish | source
fnm env --use-on-cd --shell fish | source

fzf --fish | source
set -Ux FZF_DEFAULT_OPTS '--style full --preview "bat --color=always --style=numbers --line-range=:500 {}"'

if type -q fdfind
    alias fd="fdfind"
end
if type -q batcat
    alias bat="batcat"
end
