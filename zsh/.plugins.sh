# Autojump
# source /usr/share/autojump/autojump.sh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  forgit  # git with fzf
  colorize  # ccat/cless command (cat with color)
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting  # must be added last
)

forgit_log=iglog
forgit_diff=igdiff
forgit_add=igadd
forgit_reset_head=igreset-head
forgit_ignore=igignore
forgit_restore=igrestore
forgit_clean=igclean
forgit_stash_show=igstash-show
