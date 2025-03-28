$reg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
Set-ItemProperty -Path $reg -Name AutoDetect -Value 0
Set-ItemProperty -Path $reg -Name ProxyEnable -Value 1 
Set-ItemProperty -Path $reg -Name ProxyServer -Value "escorpio:80"
Set-ItemProperty -Path $reg -Name ProxyOverride -Value '<local>'


Set-DnsClientGlobalSetting -SuffixSearchList @("rpbaad.gob.ar", "rp.ec.gba.gov.ar")
