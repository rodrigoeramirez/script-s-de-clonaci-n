@echo off
set/p ipDin= Desea configurar una IP fija? s/n: 
if %ipDin%==s goto ipfija else goto ipdinamica 
:ipdinamica
netsh interface ipv4 set address name="Ethernet" dhcp 
echo Ip dinamica configurada.
pause 2
exit
:ipfija
set/p ip= Ingrese los ultimos 3 digitos de la direccion Ip: 
cls
echo.
netsh interface ipv4 set address name="Ethernet" source=static address=172.16.2.%ip% mask=255.255.255.0 gateway=172.16.2.1
netsh interface ip add dnsservers "Ethernet" 172.17.1.24 index=1
netsh interface ip add dnsservers "Ethernet" 172.17.1.45 index=2
powershell -ExecutionPolicy Bypass -File proxy.ps1
echo Ip fija, DNS y Proxy configurada con exito! .
pause 2

rem pause>nul
exit