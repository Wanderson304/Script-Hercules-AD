#Relatorio todos os usuarios

Import-Module ActiveDirectory


function fun_all_users_report {

    $global:outputFile_tbl_report_todos_os_usuarios = "C:\Script-Hercules\Modules\01_Mod_Users\01_Com_etl\01_Report_todos_os_usuarios"
    cd $global:outputFile_tbl_report_todos_os_usuarios 

    try {
        Get-ADUser -Filter *  | Select-Object * | Export-Csv -Path .\tbl_report_todos_os_usuarios.csv -NoTypeInformation -Encoding UTF8 -ErrorAction Stop

    } catch {
        #Erro
        Write-Host "Erro ao exportar relatório: $_" -ForegroundColor Red
    }
}

