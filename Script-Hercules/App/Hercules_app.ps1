
#Imports

Import-Module C:\Script-Hercules\Modules\00_Mod_Settings\_config_global.ps1
Import-Module C:\Script-Hercules\Modules\00_Mod_Menu\01_Scripts\_config_menu.ps1
Import-Module C:\Script-Hercules\Modules\05_Mod_Logs\scp_log.ps1
Import-Module C:\Script-Hercules\Modules\01_Mod_Users\02_Com_scripts\scp_user_report.ps1
Import-Module C:\Script-Hercules\Modules\02_Mod_Groups_and_OUs\01_Groups\02_Com_scripts\scp_group_report.ps1
Import-Module C:\Script-Hercules\Modules\03_Mod_Computers\02_Comp_scripts\scp_computer_report.ps1

#inicia a geracao de logs
Start_log_session

#Limpa os arquivos .cvs e .log para evitar vazamento de dados
#Os arquivos são deletados quando o script inicia e quando ele fechado
clear_tables
banner_bem_vindo
Write-Host""
animacao_espera
Clear-host
banner_bem_vindo
Write-Host""
bem_vindo

Start-Sleep -Seconds 8



do {
    show_menu_hercules
    Write-Host""
    $choice_menu = Read-Host "Escolha um número em seguida aperte Enter "
    switch ($choice_menu) {
        '1' { 
                #RELATÓRIO De USUÁRIOS

                #Caminho do relatório
                $global:outputFile_tbl_report_todos_os_computadores = "C:\Script-Hercules\Modules\01_Mod_Users\01_Com_etl\01_Report_todos_os_usuarios"
                cd $global:outputFile_tbl_report_todos_os_computadores 

                Write-Host ""
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Você escolheu $global:RELA_De_USUARIOS. Preparando para extrair o relatório" -ForegroundColor Yellow
                Write-Host ""
                animacao_espera
                #Start-Sleep -Seconds 8

                #Remove o antigo arquivo
                Remove-Item $global:outputFile_tbl_report_todos_os_computadores\tbl_report_todos_os_usuarios.csv -Force

                Clear-Host
                banner_padrao_hercules

                Write-Host " " 
                Write-Host "Um momento estamos gerando seu relatório..." -ForegroundColor Yello
                Write-Host " " 

                Clear-Host
                banner_padrao_hercules
                Write-Host " " 

                #Finção que gera o relatório
                fun_all_users_report

                Write-Host " " 
                Write-Host "Relatório gerado... Ele será exibido em alguns segundos!" -ForegroundColor Yello

                Write-Host " " 
                Start-Sleep -Seconds 10

                start $outputFile_tbl_report_todos_os_usuarios\Report_todos_os_usuarios.xlsm

                show_menu_hercules
             }
        '2' { 
                #RELATÓRIO De GRUPOS

                #Caminho do relatório
                $global:outputFile_tbl_report_todos_os_grupos = "C:\Script-Hercules\Modules\02_Mod_Groups_and_OUs\01_Groups\01_Com_etl\01_Report_todos_os_grupos"
                cd $global:outputFile_tbl_report_todos_os_grupos 

                Write-Host ""
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Você escolheu $global:RELA_De_GRUPOS. Preparando para extrair o relatório" -ForegroundColor Yellow
                Write-Host ""
                animacao_espera
                #Start-Sleep -Seconds 8

                #Remove o antigo arquivo
                Remove-Item $global:outputFile_tbl_report_todos_os_grupos\*.csv -Force

                Clear-Host
                banner_padrao_hercules

                Write-Host " " 
                Write-Host "Um momento estamos gerando seu relatório..." -ForegroundColor Yello
                Write-Host " " 

                Clear-Host
                banner_padrao_hercules
                Write-Host " " 

                #Finção que gera o relatório
                
                #p1
                Clear-Host
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Estamos gerando o relatório. Agurade ...!"  -ForegroundColor Yellow
                Write-Host ""
                status_csv_p1_ok

                Start-Sleep -Seconds 8
                fun_all_groups_report_p1

                #p2
                Clear-Host
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Estamos gerando o relatório. Agurade ...!"  -ForegroundColor Yellow
                Write-Host ""
                status_csv_p1_ok
                status_csv_p2_ok

                Start-Sleep -Seconds 8
                fun_all_groups_report_p2

                #p3
                Clear-Host
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Estamos gerando o relatório. Agurade ...!"  -ForegroundColor Yellow
                Write-Host ""

                status_csv_p1_ok
                status_csv_p2_ok
                status_csv_p3_ok

                Start-Sleep -Seconds 8
                fun_all_groups_report_p3

                Clear-Host
                banner_padrao_hercules
                Write-Host " " 
                Write-Host "Relatório gerado... Ele será exibido em alguns segundos!" -ForegroundColor Yello

                Write-Host " " 
                Start-Sleep -Seconds 10

                start $global:outputFile_tbl_report_todos_os_grupos\Report_todos_os_grupos.xlsm

                show_menu_hercules
                                
               
             }
        '3' { 
                #RELATÓRIO De COMPUTADORES
                
                #Caminho do relatório
                $global:outputFile_tbl_report_todos_os_computadores = "C:\Script-Hercules\Modules\03_Mod_Computers\01_Com_etl\01_Report_todos_os_computadores"
                cd $global:outputFile_tbl_report_todos_os_computadores

                Write-Host ""
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Você escolheu $global:RELA_De_COMPUTADORE. Preparando para extrair o relatório" -ForegroundColor Yellow
                Write-Host ""
                animacao_espera
                #Start-Sleep -Seconds 8

                #Remove o antigo arquivo
                Remove-Item $global:outputFile_tbl_report_todos_os_computadores\tbl_report_todos_os_computadores.csv -Force

                Clear-Host
                banner_padrao_hercules

                Write-Host " " 
                Write-Host "Um momento estamos gerando seu relatório..." -ForegroundColor Yello
                Write-Host " " 

                Clear-Host
                banner_padrao_hercules
                Write-Host " " 

                #Finção que gera o relatório
                fun_all_computer_report

                Write-Host " " 
                Write-Host "Relatório gerado... Ele será exibido em alguns segundos!" -ForegroundColor Yello

                Write-Host " " 
                Start-Sleep -Seconds 10

                start $global:outputFile_tbl_report_todos_os_computadores\Report_todos_os_computadores.xlsm

                show_menu_hercules
                
            }

        '4' { 
                #RELATÓRIO OUTROS
                opcao_nao_disponivel
                   
        
            }
        '20' { 
                #Sair

                #Limpa os arquivos .cvs e .log para evitar vazamento de dados
                #Os arquivos são deletados quando o script inicia e quando ele fechado
                clear_tables
                apagar_logs

                clear-host 
                Write-Host
                show_menu_hercules
                Write-Host
                Write-Host "Você escolheu SAIR. Essa janela será fechada em 10 segundos !!!" -ForegroundColor Yellow
                Start-Sleep -Seconds 10
                Write-Host
                animacao_espera
                Write-Host
                clear-host 
                #Stop-Transcript | out-null
                exit
                Stop-Process -Name "powershell" -Force 

              }
        '21' { 
                #SOBRE
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Careegando..." -ForegroundColor Yellow
                Write-Host ""
                menu-hercules-sobre
        
        }
        '22' { 
                #AJUDA
                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Careegando..." -ForegroundColor Yellow
                Write-Host ""
                ajuda_hercules
        
        }
        '23' { 
                #CONFIGURAÇÕES
                                banner_padrao_hercules
                Write-Host ""
                Write-Host "Certo! Careegando..." -ForegroundColor Yellow
                Write-Host ""
                configuracoes_hercules
        
        }
        default {
                clear-host 
                Write-Host
                show_menu_hercules
                Write-Host
                Write-Host "Opção inválida!!!" -ForegroundColor Red
                Write-Host "Aguarde. Recarregando o menu..." -ForegroundColor Yellow 
                Start-Sleep -Seconds 5
                
                cd C:\Script-Hercules\App
                start powershell {.\Hercules_app.ps1} 
                exit
         }
    }
    if ($choice_menu -ne '0') {
            clear-host
            Write-Host
            show_menu_hercules
            #Write-Host "Opção inválida!!!" -ForegroundColor Red 
            Write-Host
            Write-Host "Aguarde. Recarregando o menu..." -ForegroundColor Yellow 
            Start-Sleep -Seconds 5
            show_menu_hercules
            #$null = Read-Host
    }
} until ($choice_menu -eq '0')

