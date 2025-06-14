# language: pt
Dado('que estou logado com o email {string} e senha {string}') do |email, senha|
  visit '/login'  # ajuste conforme a rota da sua app
  find('#email').set email
  find('#password').set senha
  click_button 'Entrar'
  expect(page).to have_current_path('/dashboard')
end

Dado('que acesso o formulario de cadastro de anúncios') do
  visit '/dashboard'

  save_and_open_page  # isso vai gerar um HTML para você abrir no navegador

  expect(page).to have_selector('button', text: /Criar anúncio/i, wait: 10)
  find('button#criar-anuncio', visible: true) # Se o botão tiver um ID específico
  find('button', text: 'Criar anúncio', visible: true) # Certifique-se de que o texto está correto
end  

Dado('que eu tenho o seguinte equipamento:') do |table|
  @equipamento = table.rows_hash.transform_keys(&:to_sym)
  log "Equipamento lido: #{@equipamento.inspect}"
end

Quando('submeto o cadastro desse item') do
  find('#nome').set @equipamento[:nome]
  find('#category').select @equipamento[:categoria]
  find('#preco').set @equipamento[:preco]

  # Se o equipamento tiver uma imagem de thumbnail
  if @equipamento[:thumb]
    thumb_path = File.join(Dir.pwd, "features/support/fixtures/images", @equipamento[:thumb])
    find("#thumbnail input[type=file]", visible: false).set thumb_path
  end

  click_button 'Cadastrar'
end


Então('devo ver esse item no meu Dashboard') do
  expect(page).to have_content(@equipamento[:nome])
  expect(page).to have_content("R$#{@equipamento[:preco]}")
end



Então('vejo a mensagem de alerta: {string}') do |mensagem|
  expect(page).to have_css('.alert', text: mensagem)
end
