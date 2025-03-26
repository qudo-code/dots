if [ -f ~/.zsh_history ]; then
    echo "alias dots='~/dots/cli.sh'" >> ~/.zshrc
else
    echo "alias dots='~/dots/cli.sh'" >> ~/.bashrc
fi
