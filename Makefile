

setup_bin:
	fd . ./bin -x chmod a+x {}

link_dotfiles:
	fd -I . ./dotfiles -x ln -s {} ~
	# old files
	ln -s .tmux.conf ~
	ln -s .tmux.conf.local ~
	ln -s .vimrc ~

bat_light_theme:
	bat --generate-config-file
	echo "--theme=\"TwoDark\"" > $(bat --config-file) 
