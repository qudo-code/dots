# -- dots start
# bun completions (only in zsh)
if [ -n "${ZSH_VERSION}" ] && [ -s "${HOME}/.bun/_bun" ]; then
    source "${HOME}/.bun/_bun"
fi

# bun
export BUN_INSTALL="${HOME}/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# -- dots end
