#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='eza -l'
alias ll='eza -al'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
. "$HOME/.cargo/env"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias lg='lazygit'

export PATH="$PATH:/home/mcmoodoo/.config/.foundry/bin"
export PATH="$PATH:/home/mcmoodoo/.local/bin"
export PATH="$PATH:/home/mcmoodoo/go/bin"
alias ollama_start='systemctl start ollama'
alias ollama_stop='systemctl stop ollama'
alias get_nitro_container_ip='~/repos/nitro-devnode/get_running_nitro_node_container_ip.sh'
alias set_env_for_nitro_container_ip='export NITRO_DOCKER_IP=$(get_nitro_container_ip)'
alias docker_start='systemctl start docker.service'
alias fix_airpods='systemctl --user restart pipewire pipewire-pulse.service wireplumber.service'
alias wrapped_shell='bwrap --ro-bind /usr /usr --ro-bind /bin /bin --ro-bind /lib /lib --ro-bind /lib64 /lib64 --dev /dev --proc /proc --tmpfs /tmp /bin/bash'

# Completions
source ~/.foundry/anvil_completions
source ~/.foundry/cast_completions
source ~/.foundry/forge_completions
source ~/.config/gitleaks/completions
source ~/.api_keys
source ~/.config/gopass/completions
source ~/.env
source ~/.completions/*
source ~/.completions/restish-completions
source ~/.completions/pnpm-completions
source ~/.completions/bun-completions
source ~/.completions/zellij-completions

# ENV
export HYPRSHOT_DIR="/home/mcmoodoo/Pictures"
export XDG_PICTURES_DIR="/home/mcmoodoo/Pictures"

set -o vi

. "/home/mcmoodoo/.config/.starkli/env"

export PATH="$PATH:/home/mcmoodoo/.local/bin"
export PATH="$PATH:/home/mcmoodoo/.bin"
export PATH="$PATH:/home/mcmoodoo/.bin/byn"
. "/home/mcmoodoo/.deno/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

