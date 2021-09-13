# PostgreSQL 備份
# 輸入值，需要備份的目的地
$target=Read-Host "Backup path (please enter the full file path)"
# DB路徑，路徑不能變動，除非安裝時有選擇其他安裝路徑
$source="C:\ProgramData\STEALTHbits\Postgres10"

#停止Stealthbits相關的服務
Stop-Service -Name postgresql-x64-10, SBTSDWEB, SBTSDAction, SBTSDAD, SBTSDEMAIL, SBTSDEVENT, SBTSDJOB ,SBTSDLICENSE, SBTSDSIEM

#備份資料庫到指定的路徑
Copy-Item -Path $source  -Recurse -Destination $target -force 
