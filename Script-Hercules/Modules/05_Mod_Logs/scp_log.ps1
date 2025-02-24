#Scripts de logs

function Start_log_session {
        Start-Transcript -Path "C:\Script-Hercules\Logs\Log_session\log_session-$(Get-Date -Format dd-MM-yyyy).log" | out-null
        #Stop-Transcript 
}

#Apagar logs
function apagar_logs {

    $global:pathlog_log_error = "C:\Script-Hercules\Logs\Log_error"
    $global:pathlog_log_session = "C:\Script-Hercules\Logs\Log_session"
    
    Remove-Item $global:pathlog_log_error\*.* 
    Remove-Item $global:pathlog_log_session\*.* 
}