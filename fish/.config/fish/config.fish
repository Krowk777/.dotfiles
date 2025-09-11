set local_config "$HOME/.local-config.fish"
if test -f "$local_config"
  source "$local_config"
end

set -g fish_greeting
fish_config theme choose Nord

starship init fish | source

fzf --fish | source
set -Ux FZF_DEFAULT_OPTS '--style full --preview "bat --color=always --style=numbers --line-range=:500 {}"'

if type -q fdfind
    alias fd="fdfind"
end
if type -q batcat
    alias bat="batcat"
end

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase
    bind -M insert \cj "fish_vi_key_bindings --no-erase default"
    bind -M insert \cn down-or-search
end
