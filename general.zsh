alias ll="ls -la"

function remove-branches-except() {
    git branch | grep -v "${1}" | xargs git branch -D
}
