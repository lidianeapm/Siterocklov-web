# language: pt
require 'faker'

# Ação de acessar a página principal
Dado('que acesso a página principal') do
  visit "/"  # ou "visit 'http://rocklov-web:3000'" se necessário
end

# Ação de submeter as credenciais de login
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
  # Se email ou senha não forem fornecidos, use o Faker para gerar valores
  email = Faker::Internet.email if email.strip.empty?
  password = Faker::Internet.password(min_length: 8) if password.strip.empty?

  # Preenche os campos com os dados fornecidos
  find('#email').set email
  find('#password').set password

  # Verifica se o botão "Entrar" está disponível para clique
  expect(page).to have_button("Entrar")

  # Clica no botão "Entrar"
  click_button "Entrar"
end

# Verifica se foi redirecionado para o Dashboard
Então('sou redirecionado para o Dashboard') do
  # Verifica se o título da página está correto (considerando variação no apóstrofo)
  expect(find('h1')).to have_text("Let`s Rock Baby")


  # Verifica se a mensagem de alerta e o botão de criar anúncio estão presentes
  expect(page).to have_css('.alert.alert-oops', text: 'Nenhum anúncio cadastrado!')
  expect(page).to have_button('Criar anúncio')
end
