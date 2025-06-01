#language: pt
Dado('que acesso a página de cadastro') do
  visit '/signup'  # Ajuste para a URL correta de cadastro
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  user = table.hashes.first

  # Preenchendo o formulário de cadastro
  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]

  click_button "Cadastrar"
end

Então('sou direcionado para o Dashboard') do
  expect(page).to have_current_path('/dashboard', wait: 10)
  expect(page).to have_content("Bem-vindo ao seu Dashboard")
end

Então('vejo a mensagem de alerta: {string}') do |mensagem|
  expect(page).to have_css('.alert', text: mensagem)
end




