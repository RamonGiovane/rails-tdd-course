require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'Visits the index page' do
    visit(customers_path)
    
    # Formas de Debugging:
    # Para printar o conteudo HTML da pagina:
    # print page.html

    # Para salvar com um arquivo HTML:
    # save_and_open_page

    # Tirar um screenshot da pagina
    page.save_screenshot('screenshot.png')
    save_and_open_page

    expect(page).to have_current_path(customers_path)
  end
end
