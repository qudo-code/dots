if [ -f ~/.zshrc ]; then
    echo "alias dots='~/dots/cli.sh'" >> ~/.zshrc
else
    echo "alias dots='~/dots/cli.sh'" >> ~/.bashrc
fi
