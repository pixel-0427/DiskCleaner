@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    @powershell start-process "%~0" -verb runas
    exit

)

rem ====================
rem Folder_Delete
rem ====================

rem Temp_Delete
title Temp-Folder_Delete...
rd /s /q C:\Windows\Temp

rem %Temp%_Delete
title %Temp%-Folder_Delete...
rd /s /q %Temp%

rem Prefetch_Delete
title Prefetch-Folder_Delete...
rd /s /q C:\Windows\Prefetch

rem SystemTemp_Delete
title SystemTemp-Folder_Delete...
rd /s /q  C:\Windows\SystemTemp

rem InterNetCache_Delete
title InterNetCache-Folder_Delete...
rd /s /q C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\

rem DownloadProgramFiles_Delete
title DownloadProgramFiles-Folder_Delete...
rd /s /q C:\Windows\Downloaded Program Files

rem RecycleBin_Delete
title RecycleBin_Delete...
rd /s /q %SYSTEMDRIVE%\$Recycle.bin

rem WindowsUpdate_Clear
title WindowsUpdateDownload-Folder_Delete...
rd /s /q C:\Windows\SoftwareDistribution

rem Event_Log_Delete
title EventLog-Folder_Delete...
rd /q C:\Windows\System32\winevt\Logs

rem Windows_Error
title WindowsErrorFiles-Folder-Delete...
rd /q C:\ProgramData\Microsoft\Windows\WER\ReportQueue

rem ====================
rem File_Delete
rem ====================

rem Memory_DMP
title MemoryDMP-Files_Delete...
cd C:\Windows
del /q MEMORY.DMP

rem Windows_Thumbnails_Cache
title ThumbnailsCache-Files_Delete...
cd C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer
del /q thumbcache_*.db

rem Windows_Icon_Cache
title IconCache-Files_Delete...
cd C:\Users\%USERNAME%\AppData\Local\
del /a:h /q IconCache.db

rem Windows_Log_Delete
title Log-Files_Delete...
cd C:\
del /a:h /s *.log

rem etl_delete
title ETL-Files_Delete...
cd c:\
del /a:h /q /s *.etl

rem dmp_delete
title DMP-Files_Delete...
cd c:\
del /a:h /q /s *.dmp

rem lkg_delete
title LKG-Files_Delete...
cd c:\
del /a:h /q /s *.lkg

rem vbm_delete
title VBM-Files_Delete...
cd c:\
del /a:h /q /s *.vbm

rem idx_delete
title IDX-Files_Delete...
cd c:\
del /a:h /q /s *.idx

rem pma_delete
title PMA-Files_Delete...
cd c:\
del /a:h /q /s *.pma

rem old_delete
title OLD-Files_Delete...
cd c:\
del /a:h /q /s *.old

rem StartComponentCleanup
title StartComponentCleanup...
Dism.exe /online /Cleanup-Image /StartComponentCleanup

rem StartComponentCleanup_ResetBase
title StartComponentCleanup/ResetBase...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

rem DNS_Cache_Clear
title DNSCache_Clear...
ipconfig /flushdns

rem MicrosoftStore_Cache_Clear
title MicrosoftStore_Reset...
wsreset.exe

rem MicrosoftStore_TaskKill
title MicrosoftStore_Taskkill...
taskkill /im WinStore.App.exe /f /t

rem Defrag
title Defrag...
defrag c: