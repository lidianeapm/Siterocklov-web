require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"
require "selenium-webdriver"
require "yaml"


ffile = ENV["CONFIG"] || "local.yml"
CONFIG = YAML.load_file(File.join(Dir.pwd, 'features', 'support', 'config', ffile))
=======
# Carrega o arquivo de configuração do ambiente (ex.: local.yml)
ffile = ENV["CONFIG"] || "local.yml"
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config", ffile))
>>>>>>> recupera-commits

# Carregar todos os arquivos Ruby de 'features/pages'
Dir[File.join(Dir.pwd, 'features', 'pages', '*_page.rb')].each { |file| require file }

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG["url"] # o Capybara entende que essa é a URL base do sistema
  config.default_max_wait_time = 5
end

=======
# Configura o Capybara
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG["url"] # URL base do sistema
  config.default_max_wait_time = 5
end

# Configura o Allure
>>>>>>> recupera-commits
AllureCucumber.configure do |config|
  config.results_directory = File.join(Dir.pwd, "logs")
  config.clean_results_directory = true
end
