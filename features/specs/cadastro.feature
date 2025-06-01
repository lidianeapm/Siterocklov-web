# language: pt

Funcionalidade: Cadastro
        Sendo um músico que possui equipamentos musicais
        Quero fazer o meu cadastro no RockLov
        Para que eu possa disponibilizá-los para locação

        @cadastro
        Cenario: Fazer cadastro
                Dado que acesso a página de cadastro
                Quando submeto o seguinte formulário de cadastro:
                        | nome            | email             | senha         |
                        | Lidiane Serafim | lidiane@gmail.com | @Ninguemsabe1 |
                Então sou direcionado para o Dashboard

    
    @tentativa_cadastro
      Esquema do Cenario: Tentativas de cadastro inválido
        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
         | nome         | email         | senha         |
        | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

 Exemplos:
    | nome_input      | email_input          | senha_input   | mensagem_output                  |
    |                 | lidiane@gmail.com    | @Ninguemsabe1 | Oops. Informe seu nome completo! |
    | Lidiane Serafim |                      | @Ninguemsabe1 | Oops. Informe um email válido!   |
    | Lidiane Serafim | lidiane&gmail.com    | @Ninguemsabe1 | Oops. Informe um email válido!   |
    | Lidiane Serafim | lidiane365@gmail.com |               | Oops. Informe sua senha secreta! |

