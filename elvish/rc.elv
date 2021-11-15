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
    ~/.idris2/bin
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

E:LS_COLORS = "no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:"
