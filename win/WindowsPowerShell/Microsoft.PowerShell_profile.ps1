function prompt {
  Write-Host " " -NoNewline
  Write-Host $($(Get-Location) -replace [regex]::escape($HOME), "~") -NoNewline -ForegroundColor DarkBlue
  Write-Host " " -NoNewline

  return "\> "
}
