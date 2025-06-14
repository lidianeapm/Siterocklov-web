class EquiposPage
  include Capybara::DSL

  def open_form
    visit '/equipos/new'
  end

  def create(equipo)
    # Preenche o nome do equipamento
    find("input[placeholder='Nome do equipamento']").set equipo[:nome]

    # Seleciona a categoria no dropdown
    select equipo[:categoria], from: 'Categoria'

    # Preenche o valor do aluguel
    find("input[placeholder='Valor do aluguel']").set equipo[:preco]

    # Faz upload da imagem se fornecida
    if equipo[:thumb]
      image_path = File.join(Dir.pwd, "features/support/fixtures/images", equipo[:thumb])
      find("#thumbnail input[type=file]", visible: false).set image_path
    end

    # Envia o formulário
    click_button 'Cadastrar'
  end
end
