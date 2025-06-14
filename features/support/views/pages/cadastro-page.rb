class CadastroPage
  include Capybara::DSL

  # Método para acessar a página de cadastro
  def abrir
    visit '/signup'
  end

  # Método para preencher o formulário de cadastro
  def preencher_formulario(nome:, email:, senha:)
    # Preenche o campo 'nome' do usuário
    find("#fullName").set nome

    # Preenche o campo 'email' do usuário
    find("#email").set email

    # Preenche o campo 'senha' do usuário
    find("#password").set senha
  end

  # Método para submeter o formulário de cadastro
  def submeter
    click_button "Cadastrar"
  end

  # Método que encapsula o fluxo completo de cadastro
  def cadastrar(nome:, email:, senha:)
    abrir
    preencher_formulario(nome: nome, email: email, senha: senha)
    submeter
  end
end
