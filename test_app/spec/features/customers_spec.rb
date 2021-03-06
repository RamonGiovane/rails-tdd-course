require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature 'Customers', type: :feature, js: true do
  it 'Visits the index page' do
    visit(customers_path)

    # Formas de Debugging:
    # Para printar o conteudo HTML da pagina:
    # print page.html

    # Para salvar com um arquivo HTML:
    # save_and_open_page

    # Tirar um screenshot da pagina
    page.save_screenshot('screenshot.png')

    expect(page).to have_current_path(customers_path)
  end

  it 'Find' do
    visit(customers_path)
    expect(find('#my-div').find('h3')).to have_content('My div')
  end

  it 'Creates a customer' do
    member =  create(:member)
    login_as(member, scope: :member)

    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Create Customer')

    expect(page).to have_content('Customer was successfully created.')
  end

  it 'Creates a customer - Page Object Pattern ' do
    NewCustomerForm.new.login.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email
      # Omiti o address, mas internamente eh chamado o valor default
    ).submit

    expect(page).to have_content('Customer was successfully created.')
  end
end
