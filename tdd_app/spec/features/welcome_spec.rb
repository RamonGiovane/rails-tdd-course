require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Mostra a mensagem de boas vindas' do
    visit('/')
    expect(page).to have_content('Bem-vindo')
  end
end
