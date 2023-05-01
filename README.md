# dotfiles

### symbolic links
`ln -sfn ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf`\
`ln -sfn ~/.dotfiles/nvim ~/.config/nvim`\
`ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf`\
`ln -sfn ~/.dotfiles/.vimrc ~/.vimrc`


### scala
Add the following to ~/.bloop/.bloop.json\
`{"javaHome":"/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home", "javaOptions": ["-Xmx2G"]}`

### .zprofile
Add the following to ~/.zprofile
>export OPENAI_API_KEY="XXX"\
export MYZSHRC="$HOME/.zshrc"\
export MYVIMRC="$HOME/.vimrc"\
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xmx2G -Xms1G"
