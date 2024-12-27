#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias lg='lazygit'

export PATH="$PATH:/home/mcmoodoo/.config/.foundry/bin"
export PATH="$PATH:/home/mcmoodoo/.local/bin"
alias ollama_start='systemctl start ollama'
alias ollama_stop='systemctl stop ollama'
alias get_nitro_container_ip='~/repos/nitro-devnode/get_running_nitro_node_container_ip.sh'
alias set_env_for_nitro_container_ip='export NITRO_DOCKER_IP=$(get_nitro_container_ip)'
alias docker_start='sudo systemctl start docker.service'

# Completions
source ~/.foundry/anvil_completions
source ~/.foundry/cast_completions
source ~/.foundry/forge_completions
source ~/.config/gitleaks/completions
source ~/.api_keys
source ~/.config/gopass/completions
source ~/.env

# ENV
export HYPRSHOT_DIR="/home/mcmoodoo/Pictures"
export XDG_PICTURES_DIR="/home/mcmoodoo/Pictures"

set -o vi
