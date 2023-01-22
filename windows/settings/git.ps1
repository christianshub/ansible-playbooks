

if (Test-Path -Path $Profile) { Remove-Item $Profile -Force }

# Check if profile script exists, and create it if it doesn't
if (!(Test-Path -Path $Profile)) { New-Item -Type File -Path $Profile -Force }

# Add custom functions to profile script
Add-Content $Profile "function fetch { git fetch }"

Add-Content $Profile "function pull { git pull origin main }"

Add-Content $Profile "function push { param([string]`$args = `"WIP`"); git add .; git commit -m `$args[0]; git push }"

Add-Content $Profile "function gitreset { git reset (git merge-base main (git branch --show-current)) }"
## test
