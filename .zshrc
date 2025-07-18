# Enable Powerlevel11k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinint and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinint
source "${ZINIT_HOME}/zinit.zsh"

#Add PowerLevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippits
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux 
# zinit snippet OMZP::aws 
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx 
zinit snippet OMZP::command-not-found

#Load zsh-completions
autoload -U compinit && compinit

zinit cdreplay -q 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybinding
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:comlete:cd:*' fzf-preview 'ls --color $realpath'

# Set up fzf key bingings and fuzzy completion
source <(fzf --zsh)

# Aliases
# alias ls='ls --color'
# alias vim='nvim' 
# alias cat='bat' 
# alias fzf='fzf --preview="bat --color=always {}"'
# alias ivim='nvim $(fzf --preview="bat --color=always {}")'

alias \
\
c="clear" \
v="nvim" \
f="fff" \
ls='ls --color' \
vim='nvim' \
cat='bat --color=auto' \
fzf='fzf --preview="bat --color=always {}"' \
ivim='nvim $(fzf --preview="bat --color=always {}")' \
l="ls -lh --color=auto --group-directories-first" \
ls="ls -h --color=auto --group-directories-first" \
la="ls -lah --color=auto --group-directories-first" \
grep="grep --color=auto" \
shell="exec $SHELL -l" \
fk="sudo !!" \
mv="mv -i" \
rm="rm -Iv" \
df="df -h" \
du="du -h -d 1" \
k="killall" \
# p="ps aux | grep $1" 

# Shll intergrations
eval "$(fzf --zsh)"
# eval "$(zoxidw init --cmd cd zsh)"
