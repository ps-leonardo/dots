if status is-interactive

    set -g fish_greeting

    fastfetch

    alias ls="eza --colour=always --icons=always --group-directories-first --all"
    alias v=nvim
    alias m=mpv
    alias q=exit
    alias shutdown="hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'"
    alias reboot="hyprshutdown -t 'Restarting...' --post-cmd 'reboot'"

    zoxide init fish | source
    starship init fish | source

end
