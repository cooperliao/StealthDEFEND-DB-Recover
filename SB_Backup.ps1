$target=Read-Host "Backup path (please enter the full file path)"
$source="C:\ProgramData\STEALTHbits\Postgres10"
Stop-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM
Copy-Item -Path $source  -Recurse -Destination $target -force 
