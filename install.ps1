New-Item -ItemType Directory -Path "$HOME\\Documents\\WindowsPowershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\WindowsPowerShell\\Microsoft.Powershell_profile.ps1"
New-Item -ItemType Directory -Path "$HOME\\Documents\\Powershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\PowerShell\\Microsoft.Powershell_profile.ps1"

New-Item -ItemType Directory -Path "$HOME\\.config"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\starship\\starship.toml" -Path "$HOME\\.config\\starship.toml"

New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\nvim" -Path "$HOME\\AppData\\Local\\nvim"

New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\git\\.gitconfig" -Path "$HOME\\.gitconfig"

$confirmation = Read-Host "Install Dep: "
if ($confirmation -eq 'y') {
    scoop install sudo
    scoop install starship
    sudo choco install zoxide

    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
}
