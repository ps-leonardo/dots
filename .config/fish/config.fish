if status is-interactive

    cat ~/.cache/wallust/sequences
    set -g fish_greeting

    fastfetch

    alias ls="eza --colour=always --icons=always --group-directories-first --all"
    alias v=nvim
    alias m=mpv
    alias q=exit

    zoxide init fish | source
    starship init fish | source

end
