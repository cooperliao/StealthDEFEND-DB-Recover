﻿$source=Read-Host "Source path (please enter the full file path)"
$target="C:\ProgramData\STEALTHbits"
$a=Read-Host "Please key OriginalDefend IP Address"
$b=Read-Host "Please key NEW Defend IP Address"
Stop-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM
Copy-Item -Path $source -Recurse -Destination  $target -Force
(Get-Content "\\fileserver\C$\Program Files\STEALTHbits\StealthAUDIT\FSAC\SBTFileMon.ini").replace($a, $b) | Set-Content "\\fileserver\C$\Program Files\STEALTHbits\StealthAUDIT\FSAC\SBTFileMon.ini"
Start-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM