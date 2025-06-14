# features/pages/login_page.rb
class LoginPage
  include Capybara::DSL

  class DashPage
    include Capybara::DSL

    def initialize
      # Adicione métodos específicos da página de Dashboard aqui
    end
  end

  def abrir
    visit "/"
  end

  def campo_email(email)
    find('input[name=user_email]', wait: 10).set(email)
  end

  def campo_senha(senha)
    find('input[name=user_password]', wait: 10).set(senha)
  end

  def botao_entrar
    click_button "Entrar"
  end

  def logar(email, senha)
    abrir
    campo_email(email)
    campo_senha(senha)
    botao_entrar
    has_content?('Dashboard', wait: 10)
  end
end


