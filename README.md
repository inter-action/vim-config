
# __目标__
主要用vim读代码, 不写代码; 还是不习惯里边的插件的操作;

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


# completion


有几种方式
* native 原生支持的
    * 
    ```
    C-n 
    C-p
    :help ins-completion
    ```

    * Omni completion, 一种原生支持的 IntelliSense 的clone版

* LSP - https://www.kieranbamforth.me/blog/vim-lsp.html
    * Coc
        * `:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css`
        * https://github.com/neoclide/coc.nvim

    * https://github.com/autozimu/LanguageClient-neovim
    * https://www.kieranbamforth.me/blog/vim-lsp.html

      ```
      tnpm i -g typescript-language-server
      ```

* YouCompleteMe, 插件支持的

* !A guide to modern Web Development with (Neo)vim - https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/


# rust.vim

https://github.com/rust-lang/rust.vim


# change default git editor
`git config --global core.editor "nvim"`

# install 
```
git clone <this git repo> && ln -s ~/vim-config/.vimrc ~/
```
