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

  # Attributes_for extrai os atributos de uma determinada Factory
  it 'Creates a Customer Using FactoryBot! (usando Heranca)' do
    attrs = attributes_for(:customer_default)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr')
  end

  it 'Creates a Customer Using FactoryBot! (sobreescrevendo o atributo)' do
    customer = create(:customer_default, name: 'Ramon')
    expect(customer.full_name).to eq('Sr. Ramon')
  end

  it 'Atributo Transitorio' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase!).to eq(customer.name)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino VIP' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 1, 4, 30) do
      @customer = create(:customer_vip)
    end

    puts @customer.created_at
    expect(@customer.created_at).to eq(Time.zone.local(2004, 11, 24, 1, 4, 30))
  end

  # Espera que se cria 1 objeto Customer no BD
  it { expect { create(:customer_default) }.to change { Customer.all.size }.by(1) }
end
