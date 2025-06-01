# language: pt

Funcionalidade: Cadastro de Anúncios
  Sendo o usuário cadastrado no Rocklov que possui equipamentos musicais 
  Quero cadastrar meus equipamentos
  Para que eu possa disponibilizar para locação

  Contexto:Login 
    *Login com "lidianealves365@gmail.com" e "@Ninguemsabe1"

@temp
  Cenário: Novo equipamento

    Dado que acesso o formulario de cadastro de anúncios
  
    E que eu tenho o seguinte equipamento:
      |thumb      | guitarra |
      | nome      | guitarra |
      | categoria | Cordas   |
      | preco     | 200      |
    Quando submeto o cadastro desse item
    Então devo ver esse item no meu Dashboard

    
   