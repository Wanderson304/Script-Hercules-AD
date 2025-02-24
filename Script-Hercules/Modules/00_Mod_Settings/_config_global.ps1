

#Exibe a versão do Script Zeus 365
$Versao = "v1.0.1 - Beta"

# Animação de espera
function animacao_espera {

    $Symbols = [string[]]('||','||','||','||','||','||','||','||','||','||','||','||','||','||')
    $SymbolIndex = [byte] 0
    $Job = Start-Job -ScriptBlock { Start-Sleep -Seconds 2 }
    while ($Job.'JobStateInfo'.'State' -eq 'Running') {
    if ($SymbolIndex -ge $Symbols.'Count') {$SymbolIndex = [byte] 0}
    Write-Host -NoNewline -Object ("{0}`b" -f $Symbols[$SymbolIndex++])
    Start-Sleep -Milliseconds 100
     }
}


 function mostrarDominio {

        $DiminioDisplay = $dominio.ToUpper()
        Write-Host  "Dominio logado: $DiminioDisplay" -ForegroundColor Gree
        Write-Host  "Usuário logado: $Env:UserName"   -ForegroundColor Gree
        Write-Host  "Versão do módulo: VS.1.0"   -ForegroundColor Gree
}


#Exibe a versão do Script Zeus 365
$Versao = "V1.0.1 - Beta"

# Animação de espera
function animacao_espera {

    $Symbols = [string[]]('||','||','||','||','||','||','||','||','||','||','||','||','||','||')
    $SymbolIndex = [byte] 0
    $Job = Start-Job -ScriptBlock { Start-Sleep -Seconds 2 }
    while ($Job.'JobStateInfo'.'State' -eq 'Running') {
    if ($SymbolIndex -ge $Symbols.'Count') {$SymbolIndex = [byte] 0}
    Write-Host -NoNewline -Object ("{0}`b" -f $Symbols[$SymbolIndex++])
    Start-Sleep -Milliseconds 100
     }
}


 function mostrar_usuario_logado {

        Write-Host  Usuário logado: $Env:UserName.ToUpper()   -ForegroundColor Gree
        Write-Host  Versão do módulo: VS.1.0   -ForegroundColor Gree
}

 #Aviso de opção em desenvolvimento

 function opcao_nao_disponivel {
                Write-Host ""
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Essa opção ainda não está disponível" -ForegroundColor Yellow
                Write-Host "Recarregando o menu ..." -ForegroundColor Yellow
                Start-Sleep -Seconds 8
                show_menu_hercules
    }


#Limpar dados ao inciar e sair do  script
function clear_tables {
    
    #Limpa dados do relatório: todos os usuarios
    $origin_01_Report_todos_os_usuarios = "C:\Script-Hercules\Modules\01_Mod_Users\01_Com_etl\00_Exemplo\"
    $destination_01_Report_todos_os_usuarios = "C:\Script-Hercules\Modules\01_Mod_Users\01_Com_etl\01_Report_todos_os_usuarios"

    cd $destination_01_Report_todos_os_usuarios
    Remove-Item $destination_01_Report_todos_os_usuarios\tbl_report_todos_os_usuarios.csv -Force
    Copy-Item -Path $origin_01_Report_todos_os_usuarios\tbl_report_todos_os_usuarios.csv -Destination $destination_01_Report_todos_os_usuarios

    #Limpa dados do relatório: todos os grupos
    $origin_01_Report_todos_os_grupos = "C:\Script-Hercules\Modules\02_Mod_Groups_and_OUs\01_Groups\01_Com_etl\00_Exemplo"
    $destination_01_Report_todos_os_grupos ="C:\Script-Hercules\Modules\02_Mod_Groups_and_OUs\01_Groups\01_Com_etl\01_Report_todos_os_grupos"
   
    cd $destination_01_Report_todos_os_usuarios
    Remove-Item $destination_01_Report_todos_os_grupos\*.csv -Force
    Copy-Item -Path $origin_01_Report_todos_os_grupos\*.csv -Destination $destination_01_Report_todos_os_grupos
    
    #Limpa dados do relatório: todos os grupos
    $origin_01_Report_todos_os_computadores = "C:\Script-Hercules\Modules\03_Mod_Computers\01_Com_etl\00_Exemplo"
    $destination_01_Report_todos_os_computadores = "C:\Script-Hercules\Modules\03_Mod_Computers\01_Com_etl\01_Report_todos_os_computadores"
    
    cd $destination_01_Report_todos_os_computadores
    Remove-Item $destination_01_Report_todos_os_computadores\*.csv -Force
    Copy-Item -Path $origin_01_Report_todos_os_computadores\*.csv -Destination $destination_01_Report_todos_os_computadores

}


