# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

export ZSH="$HOME/.ohmyzsh"
if [[ ! -d $ZSH ]]; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
fi

source $ZSH/oh-my-zsh.sh


# zinit plugins

# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# enable completion
autoload -U compinit && compinit

zinit cdreplay -q

# enable zsh git plugin
zinit snippet OMZP::git

# auto completion
bindkey '^f' autosuggest-accept
# using emac bindings
bindkey -e

# ctrl + p/n
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward

# history settings
HISTSIZE=100000
SAVEHIST=100000


# colors
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'


# --- fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# --- end:fzf


# OS 
if [[ $(uname) == "Darwin" ]]; then

    # brew install nvm 
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # ruby
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export GEM_HOME=$HOME/.gem/ruby/3.3.0
    export PATH=$GEM_HOME/bin:$PATH

    # homebrew
    # disable homebrew auto update
    export HOMEBREW_NO_AUTO_UPDATE=0
    export PATH=/opt/homebrew/bin:$PATH

    # editor
    export EDITOR=nvim

    # export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
    # export PATH=$JAVA_HOME/bin:$PATH

    # android
    export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
else
    # linux

    # nvm 
    # merge this with macos version?
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    export PATH="$HOME/.local/bin:$PATH"

    # minikube
    export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24
fi

