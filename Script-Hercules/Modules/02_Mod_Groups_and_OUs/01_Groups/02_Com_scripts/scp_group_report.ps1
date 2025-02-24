#Imports | testes
Import-Module ActiveDirectory

#----------------Infomações sobre as funções p1,p2 e p3-----------------

#fun_all_groups_report_p1
#Retorna um csv com varias propriedades 

#fun_all_groups_report_p2
#retorna apenas o nome do grupo e quantidade de usuarios nele

##fun_all_groups_report_p3
#Retorna o nome de grupo e os mebros que pertecem ao grupo

#---------------------------------------------------------------


function fun_all_groups_report_p1 {

    $global:outputFile_tbl_report_todos_os_grupos = "C:\Script-Hercules\Modules\02_Mod_Groups_and_OUs\01_Groups\01_Com_etl\01_Report_todos_os_grupos"
    cd $global:outputFile_tbl_report_todos_os_grupos 

    try {
        Get-ADGroup -filter * | Export-Csv -Path .\tbl_report_todos_os_grupos_p1.csv -NoTypeInformation -Encoding UTF8 -ErrorAction Stop

    } catch {
        #Erro
        Write-Host "Erro ao exportar relatório: $_" -ForegroundColor Red
    }
}



function fun_all_groups_report_p2 {


# Define o caminho do relatório CSV
$caminhoCSV = "$global:outputFile_tbl_report_todos_os_grupos\tbl_report_todos_os_grupos_p2.csv"

# Cria uma lista para armazenar os dados
$dados = @()

# Obtém todos os grupos do Active Directory
$grupos = Get-ADGroup -Filter * | Where-Object { $_.SamAccountName -ne $null -and $_.SamAccountName -ne "" }
  
# Itera sobre cada grupo e conta seus membros
foreach ($grupo in $grupos) {
   

    try {
        
        
        # Obtém os membros do grupo
        $membros = Get-ADGroupMember -Identity $grupo.SamAccountName -ErrorAction Stop

        # Filtra apenas usuários
        $usuarios = $membros | Where-Object { $_.ObjectClass -eq "user" }
        $quantidadeUsuarios = if ($usuarios) { $usuarios.Count } else { 0 }

        # Adiciona os dados na lista
        $dados += [PSCustomObject]@{
            Grupo   = $grupo.Name
            Usuarios = $quantidadeUsuarios
        }
    }
    catch {
        Write-Host "Ops, ocorreu um erro!"  -ForegroundColor Yellow
        Write-Output "Não conseguimos obter membros do grupos/gupo: $($grupo.Name)."  
        Write-Host "Mas vamos continuar gerando o relatório"  -ForegroundColor Yellow
        
        Clear-Host
        banner_padrao_hercules
        Write-Host ""
        Write-Host "Estamos gerando o relatório. Agurade ...!"  -ForegroundColor Yellow
        
    }
}


# Verifica se o diretório existe e cria caso não exista
$diretorio = Split-Path -Path $caminhoCSV
if (!(Test-Path $diretorio)) {
    New-Item -ItemType Directory -Path $diretorio | Out-Null
}

# Exporta os dados para um arquivo CSV
$dados | Export-Csv -Path $caminhoCSV -NoTypeInformation -Encoding UTF8 -ErrorAction Stop

}


function fun_all_groups_report_p3 {

#Créditos
#https://community.spiceworks.com/t/exporting-all-ad-groups-with-members-to-csv/828952/6
#https://www.reddit.com/r/PowerShell/comments/1fhljif/get_adgroup_members_from_a_list_of_ad_group/?tl=pt-br

$allGroupsInfo    = Get-ADGroup -Filter * -Properties members
$numHeaders       = ($allGroupsInfo | Measure-Object).count
$numColSeparators = $numHeaders - 1
$numRows = 
$allGroupsInfo | 
foreach-object { $_.members | measure-object} | 
Sort-Object count -Descending | Select-Object -First 1 |
select -ExpandProperty count

$emptyRowToAdd  = ";" * $numColSeparators + "`r`n"
$emptyRowsToAdd = $emptyRowToAdd * $numRows
$hashHeaders    = $allGroupsInfo.name -join ";"
$csvMatrix =
@"
$hashheaders
$emptyRowsToAdd
"@ | ConvertFrom-Csv -Delimiter ";"


foreach ($group in ($csvMatrix | Get-Member | where-object { $_.membertype -eq 'noteproperty' }).name) {

    for ($i = 0 ; $i -lt (($allGroupsInfo | where-object {$_.name  -eq "$group"}).members | measure-object).count; $i++) {


        $csvMatrix[$i]."$group" = 
        ($allGroupsInfo | where-object {$_.name  -eq "$group"}).members[$i]
    }
}

$csvMatrix |
export-csv "$global:outputFile_tbl_report_todos_os_grupos\tbl_report_todos_os_grupos_p3.csv" -NoTypeInformation -Encoding UTF8 -ErrorAction Stop



}