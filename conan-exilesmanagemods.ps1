$modsDir = "./conan-exiles/443030/ConanSandbox/Mods"

if (-Not (Test-Path -Path $modsDir -PathType Container)) {
  exit 0
} else {
  Set-Location -Path $modsDir
}

$modListFile = "modlist.txt"

Write-Output "Generating modlist.txt ..."
Set-Content -Path $modListFile -Value $null

Get-ChildItem -Directory | ForEach-Object {
  $modID = $_.Name
  $pakFile = Get-ChildItem -Path $_.FullName -Filter *.pak -File -ErrorAction SilentlyContinue | Select-Object -First 1

  if ($pakFile) {
    $line = "$modID\$($pakFile.Name)"
    Add-Content -Path $modListFile -Value $line
  } else {
    Write-Output "No .pak file in ConanSandbox\Mods\$modID, skipping"
  }
}

WriteOutput "Done"
exit 0
