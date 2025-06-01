
class Alert
    include Capybara::DSL
  
    def mensagem(tipo = 'dark')
      alert = find(".alert-#{tipo}", visible: true, wait: 10)
      return alert.text
    end
  end
  