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


# 颜色

在iterm中调节下颜色tab中的对比度;


# search & replacement
` $ brew install ripgrep `

* ripgrep user guide - https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
* https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/
* vim, fzf - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

# rust.vim

https://github.com/rust-lang/rust.vim


# change default git editor
`git config --global core.editor "vim"`

# install 
```
git clone <this git repo> && ln -s ~/vim-config/.vimrc ~/
```