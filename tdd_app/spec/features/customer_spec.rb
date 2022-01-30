require 'rails_helper'

feature 'Customers', type: :feature do
  scenario 'Verifica Link de Cadastro de Clientes' do
    visit root_path
    expect(page).to have_link('Cadastro de Clientes')
  end

  scenario 'Verifica Link de Novo Cliente' do
    visit root_path
    click_on('Cadastro de Clientes')
    expect(page).to have_content('Listando Clientes')
    expect(page).to have_link('Novo Cliente')
  end

  scenario 'Verifica Formulario de Novo Cliente' do
    visit customers_path
    click_on 'Novo Cliente'

    expect(page).to have_content('Novo Cliente')
  end

  scenario 'Cadastro de Clientes' do
    visit new_customer_path

    customer_name = Faker::Name.name

    fill_in('customer_name', with: customer_name)
    fill_in('customer_email', with: Faker::Internet.email)
    fill_in('customer_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('customer_avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: %w[S N].sample)

    click_on('Criar Cliente')

    expect(page).to have_content('Cliente cadastrado com sucesso!')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'Cadastro de Cliente - Erro de validação' do
    visit new_customer_path
    click_on 'Criar Cliente'
    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Mostra um cliente' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario 'Testando a pagina index' do
    c1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    c2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    visit(customers_path)
    expect(page).to have_content(c1.name).and have_content(c2.name)
    expect(page).to have_content(c1.email).and have_content(c2.email)
  end

  scenario 'Atualizacao do Cliente' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    visit edit_customer_path(customer.id)

    new_name = Faker::Name.name
    fill_in('customer_name', with: new_name)
    click_on 'Atualizar Cliente'

    expect(page).to have_content('Cliente atualizado com sucesso')
    expect(page).to have_content(new_name)
  end

  scenario 'Link Mostrar (Index Page)' do
    Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    visit(customers_path)

    find(:xpath, '/html/body/table/tbody/tr/td[3]/a').click

    expect(page).to have_content('Mostrando Cliente')
  end

  scenario 'Link Editar (Index Page)' do
    Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
      smoker: %w[S N].sample
    )

    visit(customers_path)

    find(:xpath, '/html/body/table/tbody/tr/td[4]/a').click

    expect(page).to have_content('Editando Cliente')
  end
end
