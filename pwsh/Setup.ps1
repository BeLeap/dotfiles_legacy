New-Item -ItemType Directory -Path "$HOME\\Documents\\WindowsPowershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\WindowsPowerShell\\Microsoft.Powershell_profile.ps1"
New-Item -ItemType Directory -Path "$HOME\\Documents\\Powershell"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\pwsh\\Microsoft.Powershell_profile.ps1" -Path "$HOME\\Documents\\PowerShell\\Microsoft.Powershell_profile.ps1"
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install sudo
scoop install starship
sudo Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install zoxide

New-Item -ItemType Directory -Path "$HOME\\.config"
New-Item -ItemType SymbolicLink -Value "$HOME\\.dotfiles\\starship\\starship.toml" -Path "$HOME\\.config\\starship.toml"
