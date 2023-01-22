$installPrograms = '.\install_programs.ps1'
$applySettings = '.\apply_settings.ps1'

Invoke-Expression (Invoke-RestMethod 'https://community.chocolatey.org/install.ps1')

Invoke-Expression $installPrograms
Invoke-Expression $applySettings
