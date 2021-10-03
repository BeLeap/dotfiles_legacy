# List-Item shorcuts
Set-Alias ls lsd
function ll {
    lsd -l $args
}
function .. {
    Set-Location ..
}

Set-Alias p python
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias j z
function vimrc {
	Push-Location ~/.dotfiles/nvim
	nvim
	Pop-Location
}

function Get-GitStatus { & git status -sb $args } 
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope 
function Get-GitCherryPick { & git cherry-pick $args } 
New-Alias -Name gcp -Value Get-GitCherryPick -Force -Option AllScope
function Get-GitCommitEdit { & git commit -ev $args } 
New-Alias -Name gce -Value Get-GitCommitEdit -Force -Option AllScope 
function Get-GitCommit { & git commit -m $args } 
New-Alias -Name gco -Value Get-GitCommit -Force -Option AllScope 
function Get-GitCommitAmend { & git commit --amend $args } 
New-Alias -Name gca -Value Get-GitCommitAmend -Force -Option AllScope 
function Get-GitAddAll { & git add --all $args } 
New-Alias -Name gaa -Value Get-GitAddAll -Force -Option AllScope 
function Get-GitAdd { & git add -- $args } 
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope 
function Get-GitTree { & git log --graph --oneline --decorate $args } 
New-Alias -Name gt -Value Get-GitTree -Force -Option AllScope 
function Get-GitPush { & git push --follow-tags $args } 
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope 
function Get-GitPullRebase { & git pull --rebase $args } 
New-Alias -Name gpr -Value Get-GitPullRebase -Force -Option AllScope 
function Get-GitFetch { & git fetch $args } 
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope 
function Get-GitCheckout { & git checkout $args } 
New-Alias -Name gch -Value Get-GitCheckout -Force -Option AllScope 
function Get-GitCheckoutBranch { & git checkout -b $args } 
New-Alias -Name gchb -Value Get-GitCheckoutBranch -Force -Option AllScope 
function Get-GitBranch { & git branch $args } 
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope 
function Get-GitRemoteView { & git remote -v $args } 
New-Alias -Name grv -Value Get-GitRemoteView -Force -Option AllScope
function Get-GitRemoteAdd { & git remote add $args } 
New-Alias -Name gra -Value Get-GitRemoteAdd -Force -Option AllScope


# Typo
Set-Alias clera clear
function eixt {
    exit
}

# Docker
function dock ($container) {
    docker start $container
    docker attach $container
}

Set-Alias touch New-Item
Set-PSReadlineOption -EditMode Vi

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Invoke-Expression (&starship init powershell)
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})
