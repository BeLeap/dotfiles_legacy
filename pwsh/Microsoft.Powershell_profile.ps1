# List-Item shorcuts
Set-Alias ll Get-ChildItem
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

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on zoxide's format.
function __zoxide_pwd {
    $__zoxide_pwd = Get-Location
    if ($__zoxide_pwd.Provider.Name -eq "FileSystem") {
        $__zoxide_pwd.ProviderPath
    }
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd($dir) {
    Set-Location $dir -ea Stop
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook {
    $__zoxide_result = __zoxide_pwd
    if ($__zoxide_result -ne $null) {
        zoxide add -- $__zoxide_result
    }
}

# Initialize hook.
if ($__zoxide_hooked -ne '1') {
    $__zoxide_hooked = '1'
    if ($PSVersionTable.PSVersion.Major -ge 6) {
        $ExecutionContext.InvokeCommand.LocationChangedAction = {
            $null = __zoxide_hook
        }
    } else {
        Write-Error ("`n" +
            "zoxide: PWD hooks are not supported below powershell 6.`n" +
            "        Use 'zoxide init powershell --hook prompt' instead.")
    }
}

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
function __zoxide_z {
    if ($args.Length -eq 0) {
        __zoxide_cd ~
    }
    elseif ($args.Length -eq 1 -and $args[0] -eq '-') {
        __zoxide_cd -
    }
    elseif ($args.Length -eq 1 -and (Test-Path $args[0] -PathType Container)) {
        __zoxide_cd $args[0]
    }
    else {
        $__zoxide_result = __zoxide_pwd
        if ($__zoxide_result -ne $null) {
            $__zoxide_result = zoxide query --exclude $__zoxide_result -- @args
        } else {
            $__zoxide_result = zoxide query -- @args
        }
        if ($LASTEXITCODE -eq 0) {
            __zoxide_cd $__zoxide_result
        }
    }
}

# Jump to a directory using interactive search.
function __zoxide_zi {
    $__zoxide_result = zoxide query -i -- @args
    if ($LASTEXITCODE -eq 0) {
        __zoxide_cd $__zoxide_result
    }
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

Set-Alias z __zoxide_z
Set-Alias zi __zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (the location is stored
# in $profile):
#
# Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook) -join "`n" })
