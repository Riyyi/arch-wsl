# Install WSL + arch

wsl --install archlinux --no-launch
wsl --set-default archlinux

# Bootstrap inside WSL

$pwd = (Get-Location).Path -replace '\\','/' -replace '^C:','/mnt/c'
wsl --distribution archlinux -- $pwd/bootstrap.sh phase1
wsl --shutdown
wsl --distribution archlinux -- $pwd/bootstrap.sh phase2 $env:USERNAME
