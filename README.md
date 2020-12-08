## install 


个人vim中应用的比较多的是fzf和ripgrep, 这是我自己高效应用vim的核心. 所以一定先熟悉 fzf 配置和 ripgrep 语法

```
git clone <this git repo> && ln -s ~/vim-config/.vimrc ~/
```


# tmux
`.tmux.conf.local` 这个文件没咋用, 放那里以备
  
  * tmux 主题包: https://github.com/jimeh/tmux-themepack

`ln -s .tmux.conf ~`

# vim




## __目标__
主要用vim读代码, 不写代码; 还是不习惯里边的插件的操作;

* vimawesome - 


# coc

安装coc自己的插件

`:CocInstall coc-json coc-tsserver `

opens coc config file
`:CocConfig`

研究下这个
* https://github.com/inter-action/jarvis

## install python3
```
pip3 install pynvim
```

## install cmake
`brew install cmake`

## install plugvim

```
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

:PlugInstall
```


## 颜色

在iterm中调节下颜色tab中的对比度;


## search & replacement
` $ brew install ripgrep `

* ripgrep user guide - https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
* https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/
* vim, fzf - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

## 前置条件

```
brew install fzf
brew install fd
```

## rust.vim

https://github.com/rust-lang/rust.vim


## change default git editor
`git config --global core.editor "nvim"`


## working with diff
* https://vi.stackexchange.com/questions/625/how-do-i-use-vim-as-a-diff-tool/17552#17552?s=f9dae8da7254456bba4c27ce1c375abc


