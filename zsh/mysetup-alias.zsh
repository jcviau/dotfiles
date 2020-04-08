# Quick navigation
alias ws="cd ~/ws/"
alias dotfiles="cd ~/ws/dotfiles"
alias apps="cd ~/applications/"

# Open VS Code for a specific feature
function code-ui() { code ~/ws/$1/ui }
function code-ingress() { code ~/ws/$1/ingress }
function code-service() { code ~/ws/$1/service }
