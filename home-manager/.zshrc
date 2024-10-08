

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/xy66kjyy32rb5pziv81gxz5733cxha1h-zsh-5.9/share/zsh/$ZSH_VERSION/help"




path+="$HOME/.zsh/plugins/zsh-nix-shell"
fpath+="$HOME/.zsh/plugins/zsh-nix-shell"
path+="$HOME/.zsh/plugins/powerlevel10k"
fpath+="$HOME/.zsh/plugins/powerlevel10k"
path+="$HOME/.zsh/plugins/powerlevel10k-config"
fpath+="$HOME/.zsh/plugins/powerlevel10k-config"

# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.

source /nix/store/08wjgnvgh7cagld3hqmh5a03zdi6db0y-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# oh-my-zsh extra settings for plugins

# oh-my-zsh configuration generated by NixOS
plugins=(git thefuck tmux)


source $ZSH/oh-my-zsh.sh



if [[ -f "$HOME/.zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh"
fi
if [[ -f "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
fi
if [[ -f "$HOME/.zsh/plugins/powerlevel10k-config/.p10k.zsh" ]]; then
  source "$HOME/.zsh/plugins/powerlevel10k-config/.p10k.zsh"
fi


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="/home/ejverat/.local/share/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


source ~/.zsh_profile

export EDITOR="nvim"
export PATH="$PATH:$HOME/.cargo/bin"
# export PATH=$PATH:$(go env GOPATH)/bin


function vim() {
    if [ -z "$@" ]; then
        nvim .
    else
        nvim $@
    fi
}

function dopush() {
    git add .
    git commit -m "$@"
    git push
}

function new_branch() {
    gco -b $@
    git push --set-upstream origin  $@
}

function update() {
    dir=$(pwd)
    cd ~/.config/home-manager
    echo "Updating flake..."
    nix flake update
    echo "Updating home-manager..."
    home-manager switch
    cd $dir
}

# Wasmer
export WASMER_DIR="/home/roastbeefer/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/roastbeefer/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/roastbeefer/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/roastbeefer/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/roastbeefer/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source "/nix/store/75jf8z9r07cqk266brfc04srgdg0cw3f-wezterm-20240203-110809-5046fc22/etc/profile.d/wezterm.sh"

eval "$(/nix/store/q161ialkxk9anr9z7adbi9qwc43s7819-direnv-2.34.0/bin/direnv hook zsh)"


# Aliases
alias -- 'edit'='nvim ~/.config/home-manager/home.nix'
alias -- 'll'='eza -la'
alias -- 'ls'='eza -a'
alias -- 'nv'='nvim .'
alias -- 'tree'='eza --tree'

# Named Directory Hashes


source /nix/store/ca3lm1a38jh8vn512is36y54dvr3hqn9-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=()




