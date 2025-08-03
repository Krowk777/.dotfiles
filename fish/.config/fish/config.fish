if status is-interactive
   # Commands to run in interactive sessions can go here
end
set -g fish_greeting
fish_config theme choose Nord

starship init fish | source
fzf --fish | source

if type -q fdfind
    alias fd="fdfind"
end
