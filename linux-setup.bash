
# sudo apt update && sudo apt ugprade -y

# todo: nodejs

install_apt(){
    apt_packages=(
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
    snap_packages=(
        "idea"
    )
}



