* vimawesome - 

研究下这个
* https://github.com/inter-action/jarvis

# install python3
```
sudo mkdir /usr/local/Frameworks
sudo chown $(whoami):admin /usr/local/Frameworks
brew install python3
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip3 install pynvim
```

# install cmake
`brew install cmake`

# install plugvim

```bash
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

`:PlugInstall`

youcompleteme

会在这步失败; golang 被墙所以下载的时候会出问题; 如果有ss, `copy http proxy shell export line` 到 terminal 中
```
cd ~/.vim/plugged/youcompleteme
python3 install.py --ts-completer
```


# rust.vim

https://github.com/rust-lang/rust.vim



# install 
```
git clone <this git repo> && ln -s ~/vim-config/.vimrc ~/
```