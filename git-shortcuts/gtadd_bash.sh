gtadd() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: gtadd <files>"
        return 1
    fi
    git add "$@"
}

# Add the following to your .bashrc:
_gtadd_completions() {
    local cur files
    cur="${COMP_WORDS[COMP_CWORD]}"
    
    # Fetch modified and untracked files
    files=$(git ls-files --modified --others --exclude-standard)
    
    # Support glob-like patterns
    COMPREPLY=($(compgen -W "$files" -- "$cur"))
}

complete -F _gtadd_completions gtadd


