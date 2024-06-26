if status is-interactive

    set -g fish_greeting
    fish_add_path -g /home/leonardo/Scripts/

    fastfetch

    alias ls="eza --colour=always --icons=always --group-directories-first --all"
    alias v=nvim
    alias m=mpv
    alias q=exit

    zoxide init fish | source
    starship init fish | source

end
