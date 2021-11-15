paths = [
    $@paths

    /bin
    /sbin
    /usr/bin
    /usr/sbin
    /usr/local/bin

    ~/go/bin
    ~/.cargo/bin
    ~/.deno/bin
    ~/.npm/bin
    ~/.local/bin
    ~/.config/yarn/global/node_modules/.bin
]

use tmux
use fzf
use git
use direnv

if (not (eq $E:WSL_DISTRO_NAME '')) {
  use wsl
}

E:MANPAGER = "sh -c 'col -bx | bat -l man -p'"
E:EDITOR = "nvim"
E:BAT_THEME = "gruvbox-dark"
E:LC_CTYPE = "en_US.UTF-8"
E:XDG_CONFIG_HOME = $E:HOME/.config
E:GPG_TTY = (tty)
E:LS_COLORS = "nord"

####################
# <InstallModules> #
####################
use epm
epm:install &silent-if-installed            ^
    github.com/zzamboni/elvish-completions  ^
    github.com/xiaq/edit.elv                ^
    github.com/muesli/elvish-libs           ^
    github.com/zzamboni/elvish-modules      
#####################
# </InstallModules> #
#####################

##################
# <SmartMatcher> #
##################
use github.com/xiaq/edit.elv/smart-matcher
smart-matcher:apply
###################
# </SmartMatcher> #
###################

################
# <Completion> #
################
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/comp
use github.com/zzamboni/elvish-completions/dd

use github.com/zzamboni/elvish-completions/git git-completions

git-completions:init

use github.com/zzamboni/elvish-completions/ssh
#################
# </Completion> #
#################

use github.com/zzamboni/elvish-modules/terminal-title
use github.com/zzamboni/elvish-modules/alias

#######################
# <ShorthandCommands> #
#######################
alias:new v nvim
alias:new vim nvim

alias:new k kubectl

alias:new p python3

alias:new tf terraform
########################
# </ShorthandCommands> #
########################

##############################
# <RustTerminalReplacements> #
##############################
alias:new l lsd -l
alias:new ls lsd
alias:new ll lsd -l
alias:new lt lsd --tree --depth 2
alias:new la lsd -al

alias:new cat bat

eval (zoxide init elvish | slurp)
###############################
# </RustTerminalReplacements> #
###############################

############
# <Prompt> #
############
eval (starship init elvish)
#############
# </Prompt> #
#############

#########################
# <ConfigFilesShortcut> #
#########################
fn elvrc []{
    current_dir = (pwd)
    cd ~/.elvish
    nvim rc.elv
    cd $current_dir
}

fn soelv []{
    # eval (slurp < ~/.elvish/rc.elv)
}

fn temp []{
    echo "temp"
}

fn vimrc []{
    current_dir = (pwd)
    cd ~/.config/nvim
    nvim init.vim
    cd $current_dir
}

fn tmuxconf []{
    current_dir = (pwd)
    cd ~/.dotfiles/tmux
    nvim .tmux.conf
    cd $current_dir
}
##########################
# </ConfigFilesShortcut> #
##########################
