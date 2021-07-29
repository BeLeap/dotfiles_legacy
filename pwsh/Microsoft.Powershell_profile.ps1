# List-Item shorcuts
Set-Alias ll Get-ChildItem
function .. {
    Set-Location ..
}

Set-Alias p python
Set-Alias vim nvim
Set-Alias v nvim
function vimrc {
	Push-Location ~/.dotfiles/nvim
	nvim
	Pop-Location
}

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

function Prompt {
    $ansiEscape = [char]27
    $currentDirectory = Get-Location
    $promptString = "$ansiEscape[34m$currentDirectory`r`n"
    $promptString += "$ansiEscape[35m" + [char]0x276f + "$ansiEscape[0m "
    return $promptString
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
