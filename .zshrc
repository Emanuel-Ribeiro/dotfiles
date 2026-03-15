if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-completions
    docker
    docker-compose
    npm
    node
    rust
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR=nvim
export VISUAL=nvim

alias vim='nvim'
alias claer='clear'
alias claer='clear'
alias celar='clear'
alias lclar='clear'
alias lcear='clear'
alias v='nvim'
alias gp='git push -u origin $(git branch --show-current)'
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
alias k='kubectl'
alias cat='bat'
alias ls='eza'
alias tg='terragrunt'
alias tf='terraform'
alias 2.='cd ../../'
alias 3.='cd ../../../'
alias 4.='cd ../../../../'
alias 5.='cd ../../../../../'

alias vz='nvim ~/.zshrc'
alias vn='cd ~/.config/nvim && nvim .'
alias vi='cd ~/flat/infrastructure-as-code && nvim .'
alias sb='cd ~/second-brain && nvim .'

export PATH="$HOME/.local/scripts:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH 

############## pomodoro #################

alias work="timer 45m && terminal-notifier -message 'Pomodoro'\
  -title 'Work Timer is up! Time to chill'\
  -sound Crystal"

alias rest="timer 15m && terminal-notifier -message 'Pomodoro'\
  -title 'Break is over! back to the shackles'\
  -sound Crystal"

alias wk='sleep $((1 * 5)) && osascript -e "display notification \"Pomodoro\" with title \"Work Timer is up! Time to chill\"" && afplay /System/Library/Sounds/Glass.aiff'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(/Users/toor/.local/bin/mise activate zsh)"
