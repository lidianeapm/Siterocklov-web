Before do
  # Inicializando as páginas
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @equipos_page = EquiposPage.new
  @dash_page = LoginPage::DashPage.new # Instanciando a página de dashboard corretamente

  # Maximiza ou redimensiona a janela corretamente
  page.driver.browser.manage.window.resize_to(1440, 900)
end

After do
  # Salva o screenshot e anexa ao relatório Allure
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot)
  )
end
