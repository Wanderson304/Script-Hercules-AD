

#variaveis tipo de relatorios

$global:RELA_De_USUARIOS = "RELATÓRIO De USUÁRIOS"
$global:RELA_De_GRUPOS = "RELATÓRIO De GRUPOS"
$global:RELA_De_COMPUTADORES = "RELATÓRIO De COMPUTADORES"
$global:RELA_OUTROS = "RELATÓRIO GERAISL"


#Menu de opções dos tipos de relatór
function banner_bem_vindo{
    Clear-Host
    Write-Host "==========================================================================================================" -ForegroundColor Cyan
    Write-Host "                                 BEM-VINDO AO SCRIPT HÉRCULES AD !!!                        $Versao       "                                          
    Write-Host "==========================================================================================================" -ForegroundColor Cyan 
}

function bem_vindo {

   Write-Host "Olá $Env:UserName !" 
   Write-Host
   Write-Host "Bem-vindo ao Script Hércules AD !!!" -ForegroundColor Yellow
   Write-Host "Geração de relatórios do Active Directory rápido e fácil" -ForegroundColor Yellow
   Write-Host 
   Write-Host "Um momento, logo o menu principal será exibido ! " -ForegroundColor Yellow
   Write-Host 
}



#Menu de opções dos tipos de relatór
function show_menu_hercules {
    Clear-Host
    Write-Host "==========================================================================================================" -ForegroundColor Cyan
    Write-Host "                                Hércules AD | MENU PRINCIPAL                                $Versao       "                                          
    Write-Host "==========================================================================================================" -ForegroundColor Cyan
    Write-Host " " 
    Write-Host "1 - RELATÓRIO De USUÁRIOS         " -ForegroundColor Gree    
    Write-Host "2 - RELATÓRIO De GRUPOS           " -ForegroundColor Gree   
    Write-Host "3 - RELATÓRIO De COMPUTADORES     " -ForegroundColor Gree 
    Write-Host "4 - RELATÓRIO GERAIS              " -ForegroundColor Gree 
    Write-Host 
    Write-Host "20 - SAIR                    21 - SOBRE                      22 -  AJUDA             23 -  CONFIGURAÇÕES   " -ForegroundColor Yellow
    Write-Host "===========================================================================================================" -ForegroundColor Cyan
    Write-Host
    mostrar_usuario_logado
  
}




#Menu de opções dos tipos de relatór
function banner_padrao_hercules {
    Clear-Host
    Write-Host "==========================================================================================================" -ForegroundColor Cyan
    Write-Host "                                Hércules AD | MENU PRINCIPAL                               $Versao       "                                          
    Write-Host "==========================================================================================================" -ForegroundColor Cyan 
}



 #Funcção status de geração de relatório todos os grupos do AD

 function status_csv_p1_ok {
          Write-Host "Arquivo .csv P1 exportado - OK"  -ForegroundColor Green
 }

  function status_csv_p2_ok {
          Write-Host "Arquivo .csv P2 exportado - OK"  -ForegroundColor Green
 }

 function status_csv_p3_ok {
          Write-Host "Arquivo .csv P3 exportado - OK"  -ForegroundColor Green
 }



 #Menu sobre

 function menu-hercules-sobre {

Clear-Host
Write-Host "==========================================================================================================" -ForegroundColor Cyan
Write-Host "                                      Hércules AD | SOBRE" -ForegroundColor Cyan
Write-Host "==========================================================================================================" -ForegroundColor Cyan
Write-Host 
Write-Host 
Write-Host " > Nome: Script Hércules AD"                                -ForegroundColor Gree
Write-Host " > Nome abreviado: Hércules AD"                             -ForegroundColor Gree
Write-Host " > Versão: $Versao"                                         -ForegroundColor Gree
Write-Host " > Criador: Wanderson Silva"                                -ForegroundColor Gree
Write-Host " > Contato: wanderson.silva@contactpoint.com.br"            -ForegroundColor Gree            
Write-Host 
Write-Host " 20 - SAIR                                   21 - MENU PRINCIPAL" -ForegroundColor Yellow
Write-Host 
Write-Host "==========================================================================================================" -ForegroundColor Cyan
           
            Write-Host
            Write-Host "Créditos"
            Write-Host

            Write-Host 
            Write-Host "50% desse script é uma coleção de Script pré-prontos de sites de comunidadee e Github"
            Write-Host "Abaixo a lista dos sites que colaboraram indiretamente"
            Write-Host 

            Write-Host "Nome: Usuario Neally da comunidade spicework "
            Write-Host "Site: https://community.spiceworks.com/t/exporting-all-ad-groups-with-members-to-csv/828952/6"
            Write-Host "Usamos o script de exportação de grupos"
            Write-Host 

            Write-Host "Nome: chatgpt "
            Write-Host "Site: https://chatgpt.com/"
            Write-Host "Ajudou a validar alguns scripts"
            Write-Host

            Write-Host 
            Write-Host 

            $Sair_do_sobre =  Read-Host "Escolha um número em seguida aperte Enter" 
            Write-Host 

            Switch  ($Sair_do_sobre){
                21{
                    Clear-host
                    show_menu_hercules
                    
                }

                20{
                    Clear-host
                    exit
                    Stop-Process -Name "powershell" -Force 
                }
                default{
                        Clear-Host
                        show_menu_hercules 

                        Write-Host " " 
                        Write-Host "Opção inválida! Você precisa digitar o número 1 ou 2." -ForegroundColor Red
                        Write-Host "Recaregando Menu " -ForegroundColor Yello
                        Write-Host " " 
                        animacao_espera
                        meu-zeus-sobre

                }
            }
}


#Menu ajuda_hercules

function ajuda_hercules {

            
            
            clear-host
            Clear-Host
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host "                                Hércules AD | ajuda " -ForegroundColor Cyan
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host " " 
            Write-Host "1 - Abrir página do projeto Hércules AD no Github" -ForegroundColor Green
            Write-Host "2 - Abrir página de ajuda hercules AD no Github"            -ForegroundColor Green
            Write-Host "3 - Abrir PLaylist de treinamento no Youtube"   -ForegroundColor Green
            Write-Host
            Write-Host "20 - SAIR                                   21 - MENU PRINCIPAL" -ForegroundColor Yellow
            Write-Host  
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host

            $choice = Read-Host "Escolha um número em seguida aperte Enter"

             Write-Host

            switch ($choice) {
                1 {
                   
                    Write-Host "Nessa página você vai entender o que é o Hércules AD ...."  -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    Write-Host "Um momento abrindo a página em seu navegador ...."              -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    animacao_espera
                    start https://github.com/Wanderson304/Script-Hercules-AD     
                    ajuda_hercules

                   
            
                }
                2 {
                    Write-Host "Nessa página você poderá compartilhar seu problema com outros usuários do Hercules AD ...."  -ForegroundColor Yellow
                    Write-Host "Clique no botão verde "New issus" para criar uma discução sobre seu problema ...."  -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    Write-Host "Um momento estamos abrindo a página em seu navegador ...."                                -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    animacao_espera
                    start https://github.com/Wanderson304/Script-Hercules-AD/issues     
                    ajuda_hercules
            
                }

                3 {
                    Write-Host "Nessa Playlist você vai aprender alguns recuros do Hercules AD ...."                          -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    Write-Host "Um momento estamos abrindo a Playlist em seu navegador ...."                                -ForegroundColor Yellow
                    Start-Sleep -Seconds 8
                    Write-Host ""
                    animacao_espera
                    start https://github.com/Wanderson304/Script-Hercules-AD/wiki/Treinamento     
                    ajuda_hercules
            
                }
                
                 20 {

                    clear-Host
                    exit
                    Stop-Process -Name "powershell" -Force 
                }
                    

                21 {
                   
                    clear-Host
                    show_menu_hercules

                    #start powershell {..\App\Home.ps1}
                    #exit
                    
                     
                }

	            }
                Default {
                     $choice = Read-Host "Escolha um número em seguida aperte Enter"  -ForegroundColor Red
                }

}


#Configurações do Hércules AD
#CUIDADO ...

function configuracoes_hercules {

            
            
            clear-host
            Clear-Host
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host "                                Hércules AD | configurações " -ForegroundColor Cyan
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host " " 
            Write-Host "1 - Apagar logs, tabelas atuais e carregar tabelas de exemplo"    -ForegroundColor Green
            Write-Host
            Write-Host "20 - SAIR                                   21 - MENU PRINCIPAL" -ForegroundColor Yellow
            Write-Host  
            Write-Host "==========================================================================================================" -ForegroundColor Cyan
            Write-Host

            $choice = Read-Host "Escolha um número em seguida aperte Enter"

             Write-Host

            switch ($choice) {
                1 {
                   
                   Write-Host "  "
                   decisaoUsuario_configuracoes_hercules_opt_01
                   Write-Host "  "
               
                }
                
                
                 20 {

                    clear-Host
                    exit
                    Stop-Process -Name "powershell" -Force 
                }
                    

                21 {
                   
                    clear-Host
                    show_menu_hercules

                    #start powershell {..\App\Home.ps1}
                    #exit
                    
                     
                }

	            }
                Default {
                     $choice = Read-Host "Escolha um número em seguida aperte Enter"  -ForegroundColor Red
                }

}


#Validação para quando o usuario escolher a opção 1 no da função configuracoes_hercules
function decisaoUsuario_configuracoes_hercules_opt_01 {

     Clear-Host
     Write-Host "==========================================================================================================" -ForegroundColor Cyan
     Write-Host "                                Hércules AD | configurações " -ForegroundColor Cyan
     Write-Host "==========================================================================================================" -ForegroundColor Cyan
     Write-Host " "

    Write-Host "                                   ATENÇÃO!" -ForegroundColor Red
    Write-Host 

    #Habilitar apenas em produção
    

    Write-Host "   $Env:UserName, essa ação vai pagar todos os arquivos .csv, logs e carregar arquivos .csv de exemplos."
   
    Write-Host ""
    Write-Host ""
    Write-Host "Tem certeza que deseja realizar essa ação ? "
    
    Write-Host ""
    Write-Host " 1 - Sim "  -ForegroundColor Yellow
    Write-Host " 2 - Não "  -ForegroundColor Yellow
    Write-Host ""

    $choice_decidir = Read-Host "Escolha um número em seguida aperte Enter" 

    if($choice_decidir -eq 1){
        
        Clear-Host
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host "                                Hércules AD | configurações " -ForegroundColor Cyan
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host " " 

        Write-Host "Apagando tabelas/arquivos .csv " -ForegroundColor Yellow
        Start-Sleep -Seconds 10
        Write-Host " "
        animacao_espera    
        clear_tables

        Clear-Host
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host "                                Hércules AD | configurações " -ForegroundColor Cyan
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host " " 
        Write-Host "Apagando arquivos de logs " -ForegroundColor Yellow
        Start-Sleep -Seconds 10
        Write-Host " "
        animacao_espera
        apagar_logs

        Clear-Host
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host "                                Hércules AD | configurações " -ForegroundColor Cyan
        Write-Host "==========================================================================================================" -ForegroundColor Cyan
        Write-Host " " 
        Write-Host "Tudo pronto!!!" -ForegroundColor Yellow
        Write-Host " " 
        Write-Host "Tabela .csv apagadas - OK " -ForegroundColor Green
        Write-Host "Arquivos de Logs apagados - OK " -ForegroundColor Green
        Write-Host " " 

        Start-Sleep -Seconds 10
        configuracoes_hercules
    
    }Else{
    
        configuracoes_hercules

    }

    Write-Host ""
    Write-Host ""
    }
