Import-Module ActiveDirectory


#RELATÓRIO De COMPUTADORES


function fun_all_computer_report {
    
    $global:outputFile_tbl_report_todos_os_computadores = "C:\Script-Hercules\Modules\03_Mod_Computers\01_Com_etl\01_Report_todos_os_computadores"
    cd $global:outputFile_tbl_report_todos_os_computadores 

    try {
        Get-ADComputer -Filter * | Export-Csv -Path .\tbl_report_todos_os_computadores.csv -NoTypeInformation -Encoding UTF8 -ErrorAction Stop
    } catch {
        #Write-Host "Erro ao exportar relatório: $_" -ForegroundColor Red
    }
}