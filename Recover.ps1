# PostgreSQL 還原
# 備份檔來源路徑
$source=Read-Host "Source path (please enter the full file path)"
# DB路徑，路徑不能變動，除非安裝時有選擇其他安裝路徑
$target="C:\ProgramData\STEALTHbits"

# 輸入原本defend IP and 新的要接收資料的Defend IP
$a=Read-Host "Please key OriginalDefend IP Address"
$b=Read-Host "Please key NEW Defend IP Address"

#停止Stealthbits相關服務
Stop-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM

# 從備份的DB備份到PostgreSQL DB路徑
Copy-Item -Path $source -Recurse -Destination  $target -Force

#更改接收資料的DEFEND IP，手動修改SAM Agent Setting(SBTFileMon.ini路徑)
(Get-Content "\\fileserver\C$\Program Files\STEALTHbits\StealthAUDIT\FSAC\SBTFileMon.ini").replace($a, $b) | Set-Content "\\fileserver\C$\Program Files\STEALTHbits\StealthAUDIT\FSAC\SBTFileMon.ini"

#啟動Stealthbits相關服務
Start-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM
