


## install 


个人vim中应用的比较多的是fzf和ripgrep, 这是我自己高效应用vim的核心. 所以一定先熟悉 fzf 配置和 ripgrep 语法

```
git clone <this git repo> && ln -s ~/vim-config/.vimrc ~/
```


# tmux
`.tmux.conf.local` 这个文件没咋用, 放那里以备
  
  * tmux 主题包: https://github.com/jimeh/tmux-themepack

`ln -s .tmux.conf ~`


# brew

all apps & cli apps are managed by homebrew, all formula are exported as Brewfile.
for detail: visit `brew bundle --help`


## search & replacement
` $ brew install ripgrep `

* ripgrep user guide - https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
* https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/
* vim, fzf - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

## cli tools/apps

* fd, fzf, bat, gitui, ripgrep, git delta, zsh (with git plugin), 




# vim (deprecated)

vim config in this repo is deprecated, in favor of more modern lua config that is in my __dot_config__ repo.
it is not got delete for archive reason.



## 颜色
在iterm中调节下颜色tab中的对比度;


## change default git editor
`git config --global core.editor "nvim"`


## working with diff
* https://vi.stackexchange.com/questions/625/how-do-i-use-vim-as-a-diff-tool/17552#17552?s=f9dae8da7254456bba4c27ce1c375abc


