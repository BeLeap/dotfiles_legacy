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
]

use tmux

E:MANPAGER = "sh -c 'col -bx | bat -l man -p'"

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

use github.com/zzamboni/elvish-modules/alias alias

#######################
# <ShorthandCommands> #
#######################
alias:new v nvim
alias:new vim nvim
########################
# </ShorthandCommands> #
########################

##############################
# <RustTerminalReplacements> #
##############################
alias:new l exa
alias:new ls exa
alias:new ll exa -l

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

fn velvrc []{
    current_dir = (pwd)
    cd ~/.elvish
    nvim rc.elv
    cd $current_dir
}
