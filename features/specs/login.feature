#language: pt

Funcionalidade: Login
Sendo um músico que possui equipamentos musicais
Quero fazer o meu cadastro no RockLov
Para que eu possa disponibilizá-los para locação

@login
Cenario: Login do usuário

    Dado que acesso a página principal
    Quando submeto minhas credenciais com "lidianeaserafim@gmail.com" e "@Ninguemsabe1"
    Então sou redirecionado para o Dashboard


Esquema do Cenário: Tentar logar com dados inválidos
  
  Dado que acesso a página principal
 Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
 Então vejo a mensagem de erro no login: "<mensagem_output>"


  Exemplos:
  | email_input               | senha_input   | mensagem_output                  |
  |                           | @Ninguemsabe  | Oops. Informe um email válido!   |
  |lidianealves&gmail.com     | @Ninguemsabe1 | Oops. Informe um email válido!   |
  |lidianealves365gmail.com   | @Ninguemsabe1 | Oops. Informe um email válido!   |
  |lidianealves365@gmail.com  |               |Oops. Informe sua senha secreta!  |