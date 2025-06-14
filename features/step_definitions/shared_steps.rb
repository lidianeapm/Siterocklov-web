# Passo para garantir que o usuário foi redirecionado para o Dashboard
Então('sou direcionado para o Dashboard') do
  expect(page).to have_current_path('/dashboard', wait: 10)
end

# Passo para verificar a mensagem de alerta
Então("vejo a mensagem de alerta: {string}") do |expected_alert|
  expect(@alert.dark).to eql(expected_alert)  # Corrigido para comparar com expected_alert corretamente
end
