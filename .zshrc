# Enable Powerlevel8k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.dotfiles/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -e

autoload -U compinit; compinit -D $HOME/.dotfiles

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"

# -------------Alias-------------

alias ls="lsd"
alias ll="ls -la"
alias nvf='nvim $(fzf)'



# Zsh-autocomplete
source $HOME/.dotfiles/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#Add color when ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename $HOME/.dotfiles/.zshrc

# autoload -Uz compinit
# compinit -d $HOME/.dotfiles/.zcompdump

# End of lines added by compinstall

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/datarch/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/datarch/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/datarch/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/datarch/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/datarch/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/datarch/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

#Syntax hightlighting, autosuggestion and add zsh-completions opt

# source $HOME/.dotfiles/completion.zsh
fpath=($HOME/.dotfiles/zsh_plugins/zsh-completions/src $fpath)
source $HOME/.dotfiles/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.dotfiles/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/zsh_plugins/zsh-z/zsh-z.plugin.zsh
# Fzf-tab
# source $HOME/.dotfiles/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh
# Source theme
source $HOME/.dotfiles/zsh_themes/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
