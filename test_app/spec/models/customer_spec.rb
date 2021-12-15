require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :customers

  it 'Creates a Customer' do
    subject.name = 'Ramon'
    subject.email = 'ramon@gmail.com'
    subject.save
    expect(subject.name).to eq('Ramon')
  end

  it 'Creates a Customer Using Fixtures!' do
    customer = customers(:ramon)
    expect(customer.full_name).to eq('Sr. Ramon Giovane')
  end

  it 'Creates a Customer Using FactoryBot!' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr.')
  end

  it 'Creates a Customer Using FactoryBot! (usando Alias)' do
    customer = create(:user)
    expect(customer.full_name).to start_with('Sr.')
  end

  it 'Creates a Customer Using FactoryBot! (usando Heranca)' do
    c1 = create(:customer_default)
    expect(c1.vip).to eq(false)

    c2 = create(:customer_vip)
    expect(c2.vip).to eq(true)

    c3 = create(:customer)
    expect(c3.vip).to eq(nil)
  end

  it 'Creates a Customer Using FactoryBot! (sobreescrevendo o atributo)' do
    customer = create(:customer, name: 'Ramon')
    expect(customer.full_name).to start_with('Sr. Ramon')
  end

  # Espera que se cria 1 objeto Customer no BD
  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1)}
end
