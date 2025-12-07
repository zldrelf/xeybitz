# ~/.config/fish/conf.d/aliases.fish
alias ll='ls -lah --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias v='nvim'
alias h='history | less'
alias ..='cd ..'

alias ff='fastfetch'
alias x='helix'
alias m='tmux'
alias hx='helix'
alias z='zellij'

alias install="paru -S"
alias update="paru -Syu"
alias remove="paru -Rns"
alias fi="flatpak install"
alias fu="flatpak update"
alias fr="flatpak uninstall"
alias clean="sudo paccache -r && sleep 2 && sudo pacman -Rns $(pacman -Qtdq) && sleep 2 && sudo paccache -ruk0"

################################
