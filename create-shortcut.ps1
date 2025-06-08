# BOOKMARK.md Desktop Shortcut Creator

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\BOOKMARK-docs-hub.lnk")
$Shortcut.TargetPath = "C:\Users\sohae\OneDrive\Coding\docs-hub\BOOKMARK.md"
$Shortcut.WorkingDirectory = "C:\Users\sohae\OneDrive\Coding\docs-hub"
$Shortcut.Description = "O4O Platform docs-hub BOOKMARK"
$Shortcut.Save()

Write-Host "Desktop shortcut created successfully!"
Write-Host "Location: Desktop\BOOKMARK-docs-hub.lnk"
