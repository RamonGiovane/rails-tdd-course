require 'rails_helper'

feature 'Welcome', type: :feature do
  scenario 'Mostra a mensagem de boas vindas' do
    visit(root_path) # o mesmo que usar '/'
    expect(page).to have_content('Bem-vindo')
  end

  scenario 'Verificar o link de cadastro de clientes' do
    visit(root_path)
    expect(page).to have_selector('ul li a')
    expect(find('ul li')).to have_link('Cadastro de Clientes')
  end
end
