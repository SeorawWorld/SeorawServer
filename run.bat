@echo off
:start
title Seoraw

del /Q logs\*.*

git fetch --all
git reset --hard origin/master
git pull

del /Q backup\*.*
mkdir backup
"C:\Program Files\WinRAR\WinRAR.exe" a backup\world_new.rar -o world_new
"C:\Program Files\WinRAR\WinRAR.exe" a backup\world_nether.rar -o world_nether
"C:\Program Files\WinRAR\WinRAR.exe" a backup\world_the_end.rar -o world_the_end

"..\zulu17\bin\java.exe" -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar paper.jar -nogui
cls
goto :start
pause
