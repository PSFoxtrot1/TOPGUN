#function TopGun-Function {


Write-Host {



            }
Write-Host '                                          -=TOPGUN=-                               '
Write-Host '                                             v.05                                  '
Write-Host '          _________________________________________________________________________'
Write-Host '                                                                      '
Write-Host '                                           Actions:                   '
Write-Host '                                                                      '
Write-Host '                   [1] Shadow RDP      | Remote Desktop Help          '
Write-Host '                   [6] PrintScreen     | Get Preview from Remote PC   '
Write-Host '                   ___________________________________________________'
Write-Host '                                                                      '
Write-Host '                   [2] Kill Process    | Stop-Process on Remote PC    '
Write-Host '                   [3] Reset Service   | Restart-Service on Remote PC '
Write-Host '                   [4] Kill User       | Logout User from Remote PC   '
Write-Host '                   [5] Reboot PC       | Restart PC                   '
Write-Host '                                                                      '
Write-Host '                   ___________________________________________________'
Write-Host '                                                                      '
Write-Host '                   [0] EXIT            | Exit                         '
Write-Host '                                                                                   '
Write-Host '         __________________________________________________________________________'
Write-Host '                                                                                   '

$PlayWavVyistrel=New-Object System.Media.SoundPlayer
$PlayWavVyistrel.SoundLocation='C:\sounds\vyistrel-pistoleta-magnum.wav'


$choice = $(Write-Host '         Choose Action from menu [1,2,3,4,5,6,0...]:  ' -ForegroundColor Red  -NoNewLine; Read-Host) 
Switch($choice){

1{$SRV1 = Read-Host 'CONNECT TO SERVER'
quser /server:$SRV1
$ID = Read-Host 'CONNECT TO USER ID' 
Mstsc /shadow:$ID /v:$SRV1 /control /noConsentPrompt
clear-host}

    2{$SRV2 = Read-Host 'CONNECT TO SERVER'
    Get-Process -ComputerName $SRV2
    Invoke-Command -ComputerName $SRV2 -ScriptBlock {$PID1 = Read-Host 'Enter Name of Process'; Stop-Process -Force -name $PID1}
    clear-host}

        3{$SRV3 = Read-Host 'CONNECT TO SERVER'
        Get-Service -ComputerName $SRV3
        Invoke-Command -ComputerName $SRV3 -ScriptBlock {$SID1 = Read-Host 'Enter Name of Service'; Restart-Service $SID1 -Force}
        Read-Host -Prompt 'Press any key to exit'}

            4{$SRV4 = Read-Host 'CONNECT TO SERVER'
            quser /server:$SRV4
            $ID4 = Read-Host 'SELECT USER ID'
            $PlayWavVyistrel.PlaySync()
            rwinsta $ID4 /server:$SRV4
            clear-host}

                5{$SRV5 = Read-Host 'Enter server name'
                shutdown /m \\$SRV5 /r /t 00 /f
                clear-host}
                
0{exit}
default{Write-Host 'Wrong action, try again' -ForegroundColor Red; #PowerShell.exe -command {TopGun-Function}}

}


