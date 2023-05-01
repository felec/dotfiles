# dotfiles

### symbolic links
`ln -sfn ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf`\
`ln -sfn ~/.dotfiles/nvim ~/.config/nvim`\
`ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf`\
`ln -sfn ~/.dotfiles/.vimrc ~/.vimrc`


### scala
Add the following to ~/.bloop/.bloop.json\
`{"javaHome":"/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home", "javaOptions": ["-Xmx4096m"]}`

### .zprofile
Add the following to ~/.zprofile
>export OPENAI_API_KEY="XXX"\
export MYZSHRC="$HOME/.zshrc"\
export MYVIMRC="$HOME/.vimrc"
