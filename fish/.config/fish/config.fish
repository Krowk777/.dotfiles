set local_config "$HOME/.local-config"
if test -f "$local_config"
	source "$local_config"
end

set -g fish_greeting
fish_config theme choose Nord

starship init fish | source
fzf --fish | source
fnm env --use-on-cd --shell fish | source

if type -q fdfind
    alias fd="fdfind"
end
