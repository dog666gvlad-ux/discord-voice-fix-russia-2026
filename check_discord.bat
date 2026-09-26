@echo off
chcp 65001 > nul
title Discord Voice Diagnostic Tool 2026
color 0b

echo ========================================================
echo  ДИАГНОСТИКА ПОДКЛЮЧЕНИЯ К СЕРВЕРАМ DISCORD (ГОЛОС / RTC)
echo ========================================================
echo.

echo [1/3] Сброс локального DNS-кэша...
ipconfig /flushdns > nul
echo [+] Кэш DNS успешно очищен.
echo.

echo [2/3] Проверка задержки до центрального шлюза Discord...
ping -n 3 gateway.discord.gg | findstr /i "TTL= Среднее"
echo.

echo [3/3] Пинг европейских голосовых серверов (RTC / Voice Nodes)...
echo - Frankfurt Voice Node:
ping -n 2 frankfurt.voice.discord.gg | findstr /i "TTL= Среднее"
echo - Rotterdam Voice Node:
ping -n 2 rotterdam.voice.discord.gg | findstr /i "TTL= Среднее"
echo.

echo ========================================================
echo РЕЗУЛЬТАТ ДИАГНОСТИКИ:
echo Если пинг отсутствует или превышает 150ms — доступ 
echo к голосовым кластерам блокируется вашим провайдером.
echo Для обхода используйте инструкцию из файла README.md
echo ========================================================
echo.
pause
