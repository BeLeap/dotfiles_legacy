New-Item -ItemType Directory -Path "$HOME\\Documents\\WindowsPowershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\WindowsPowerShell\\Microsoft.Powershell_profile.ps1"
New-Item -ItemType Directory -Path "$HOME\\Documents\\Powershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\PowerShell\\Microsoft.Powershell_profile.ps1"
