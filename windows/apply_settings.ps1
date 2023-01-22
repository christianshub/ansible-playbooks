$settings_dir = 'settings'
Invoke-Expression -Command ('.\{0}\vscode_extensions.ps1' -f $settings_dir)

# Set registries
Start-Process -FilePath (".\{0}\registries.bat" -f $settings_dir) -Verb runas
