@echo off
color 0c
echo -
echo [ROLEPLAY STARTER] JESUS TE AMA ...
echo -
rd /s /q "cache"
timeout 2
test&cls
color 0c  
echo \-------------------------------------------------------------------------/
echo \---                ## ROLEPLAY STARTER ## -- Created BY: ! discord.gg/BaEeu8M / EXPOSED BY ! DARIX FiveM SCRIPTS#0001    ---/
echo \-------------------------------------------------------------------------/ 
echo CAPTURANDO O IP da minha pica pois eu não encontro ass:krawk...
pause
timeout 1
:loop
color 0a 
@echo (%time%) STARTANDO SERVIDOR... Run Reiniciou
color 0a
@echo Pressione Enter nesta janela para reiniciar o servidor imediatamente, mantenha esta janela aberta para reinicializacoes automaticas do servidor de 5 em 5 horas.
start "Base - Created BY: DARIX discord.gg/BaEeu8M / EXPOSED BY ! DARIX FiveM SCRIPTS#0001" ..\ARTEFATOS\FXServer.exe +exec config.cfg +set onesync_enableInfinity 1
timeout /t 38000
taskkill /f /im FXServer.exe
@echo Encerramento do servidor com sucesso.
timeout /t 2 >nul
taskkill /F /FI "WindowTitle eq Server"
@echo Servidor esta reiniciando agora.
timeout /t 10
cls
goto loop