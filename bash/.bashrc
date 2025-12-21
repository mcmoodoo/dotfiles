#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#
alias ls='ls --color=auto'
alias l='eza -l'
alias ll='eza -al'
alias grep='grep --color=auto'

alias z="zellij"
alias tf="terraform"
alias y='yazi'

alias find_repos_with_remotes='~/.my-scripts/scan_repos_with_remotes.py'
alias fix_touchpod='sudo modprobe -r i2c_hid_acpi && sudo modprobe i2c_hid_acpi'

PS1='[\u@\h \W]\$ '

# alias fzf_search='fzf --preview "bat --style=numbers --color=always --line-range :100 {}"'
eval "$(fzf --bash)"

# bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# source /usr/share/fzf/completion.bash
# source /usr/share/fzf/key-bindings.bash

# powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

eval "$(starship init bash)"
# . "$HOME/.cargo/env"

alias lg='lazygit'

export EDITOR=nvim

export NIXOS_OZONE_WL=1
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland

export PATH="$PATH:/home/mcmoodoo/.foundry/bin"
export PATH="$PATH:/home/mcmoodoo/.local/bin"
export PATH="$PATH:/home/mcmoodoo/go/bin"
export PATH="$PATH:/home/mcmoodoo/.cargo/bin"
export PATH="$PATH:/home/mcmoodoo/.yarn/bin"

alias fix_airpods='systemctl --user restart pipewire pipewire-pulse.service wireplumber.service'
alias wrapped_shell='bwrap --ro-bind /usr /usr --ro-bind /bin /bin --ro-bind /lib /lib --ro-bind /lib64 /lib64 --dev /dev --proc /proc --tmpfs /tmp /bin/bash'

# Completions
source ~/.env
source ~/.completions/*
source ~/.completions/mimic-completions
source ~/.completions/anvil_completions
source ~/.completions/cast_completions
source ~/.completions/forge_completions
source ~/.completions/gitleaks_completions
source ~/.completions/restish-completions
source ~/.completions/tenderly-completions
source ~/.completions/pnpm-completions
source ~/.completions/bun-completions
source ~/.completions/zellij-completions
source ~/.completions/sqlx-completions
source ~/.completions/volta-completions
source ~/.completions/just-completions
source ~/.completions/runpod-completions

# ENV
export HYPRSHOT_DIR="/home/mcmoodoo/Pictures"
export XDG_PICTURES_DIR="/home/mcmoodoo/Pictures"

set -o vi

export PATH="$PATH:/home/mcmoodoo/.local/bin"
export PATH="$PATH:/home/mcmoodoo/.bin"
export PATH="$PATH:/home/mcmoodoo/.bin/byn"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

complete -C "$(which aws_completer)" aws

# source /home/mcmoodoo/.config/broot/launcher/bash/br

export NARGO_HOME="/home/mcmoodoo/.nargo"

export PATH="$PATH:$NARGO_HOME/bin"
