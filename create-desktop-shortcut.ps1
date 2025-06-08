# BOOKMARK.md 바탕화면 바로가기 생성 스크립트

# PowerShell로 바탕화면에 바로가기 생성
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\📚 BOOKMARK - docs-hub.lnk")
$Shortcut.TargetPath = "C:\Users\sohae\OneDrive\Coding\docs-hub\BOOKMARK.md"
$Shortcut.WorkingDirectory = "C:\Users\sohae\OneDrive\Coding\docs-hub"
$Shortcut.Description = "O4O Platform 문서 허브 - 바로가기"
$Shortcut.Save()

Write-Host "✅ 바탕화면에 BOOKMARK.md 바로가기가 생성되었습니다!"
Write-Host "📁 위치: 바탕화면\📚 BOOKMARK - docs-hub.lnk"
