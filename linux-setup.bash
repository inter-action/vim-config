#!/bin/env bash

# sudo apt update && sudo apt ugprade -y

install_apt(){
    apt_packages=(
        "docker.io"
        "docker-compose"
        "luarocks" 
        "cmake"
        "openjdk-17-jdk"
        "neovim"
        "fzf"
        "fd-find"
        "ripgrep"
        "tree-sitter-cli"
        "zsh"
        "gh"
        "ffmpeg"
        "golang-go"
        "samba"
        "shellcheck"
    )

    sudo apt install "${apt_packages[@]}" -y
}




# rust
install_rust(){
    sudo apt install rustup -y
    rustup default stable
    # cargo 
    cargo install git-delta gitui
}


# nodejs
install_nodejs(){
    # install nvm
    NVM_DIR="$HOME/.nvm" 

    git clone --depth=1 https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    \. "$NVM_DIR/nvm.sh"

    # 
    nvm install node
}


install_snap(){
    snap_classic_packages=(
        "idea"
        "kubectl"
    )
    sudo snap install "${snap_classic_packages[@]}" --classic
}


install_tmux() {
    cd $HOME
    git clone git@github.com:inter-action/vim-config.git

    cd "$HOME/vim-config" && cp .tmux.conf .tmux.conf.local ..
}

# install_config_files() {
# todo
# https://github.com/inter-action/dot_config
# }


fix_apt(){
    # https://askubuntu.com/questions/908800/what-does-this-apt-error-message-download-is-performed-unsandboxed-as-root
    sudo chown -Rv _apt:root /var/cache/apt/archives/partial/
    sudo chmod -Rv 700 /var/cache/apt/archives/partial/
}


install_nerd_fonts(){
    declare -a fonts=(
        #FiraCode
        #FiraMono
        JetBrainsMono
        VictorMono
        #Meslo
    )

    version='3.3.0'
    fonts_dir="${HOME}/.local/share/fonts"

    if [[ ! -d "$fonts_dir" ]]; then
        mkdir -p "$fonts_dir"
    fi

    for font in "${fonts[@]}"; do
        zip_file="${font}.zip"
        download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
        echo "Downloading $download_url"
        wget "$download_url"
        unzip "$zip_file" -d "$fonts_dir"
        rm "$zip_file"
    done

    find "$fonts_dir" -name '*Windows Compatible*' -delete

    fc-cache -fv
}

fix_docker_user(){
    # add user to docker group
    newgrp docker 
    sudo usermod -aG docker $USER
}

fix_fd(){
    mkdir -p ~/.local/bin
    ln -s $(which fdfind) ~/.local/bin/fd

    rg -F 'local/bin' ~/.zshrc

    if [[ $? -ne 0 ]]; then
        echo "append ~/.local/bin to PATH"
        echo -e 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    fi
}


edit_git_delta(){
    # todo: this file could be in non-exist state
    # check existense first?
    rg delta ~/.gitconfig

    if [[ $? -ne 0 ]]; then
        echo "append delta config to .gitconfig file"


        cat << EOF >> ~/.gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true  # use n and N to move between diff sections
    dark = true      # or light = true, or omit for auto-detection
    side-by-side = true
    line-numbers = true

[merge]
    conflictstyle = zdiff3
EOF

        # tee -a ~/.gitconfig <<EOT
        # EOT
    fi

}

fix_fd

