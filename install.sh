if [ -f ~/.zsh_history ]; then
    echo "alias dots='~/dots/cli.sh'" >> ~/.zshrc
    source ~/.zshrc
else
    echo "alias dots='~/dots/cli.sh'" >> ~/.bashrc
    source ~/.bashrc
fi

dots
