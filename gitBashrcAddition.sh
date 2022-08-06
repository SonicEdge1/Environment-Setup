echo 'source ~/.git-prompt.sh # Show git branch name at command prompt' >> ~/.bashrc
cat <<'EOT' >> ~/.bashrc

# GIT bash integration
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then 
    source /usr/lib/git-core/git-sh-prompt
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWUPSTREAM="auto"

    # use existing PS1 settings
    PROMPT_COMMAND=$(sed -r 's|^(.+)(\\\$\s*)$|__git_ps1 "\1" "\2"|' <<< $PS1)
fi
EOT

source ~/.bashrc
echo "[INFO] git-promt installed. You must restart any open terminals to see changes take effect."

