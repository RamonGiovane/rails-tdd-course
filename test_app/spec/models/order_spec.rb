require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Customer tem 1 pedido - belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Criando 3 pedidos - create_list' do
    # Para criar varios objetos com FactoryBot.
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)

    # Podemos tambem sobrescrever os atributos
    orders = create_list(:order, 3, description: 'Sobrescrevendo...')
    expect(orders.count).to eq(3)
  end

  it 'Customer tem 3 pedidos - has_many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)
  end

  it 'Customer tem 3 pedidos - has_many (usando Traits)' do
    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end

  it 'Customer n pedidos - has_many' do
    customer = create(:customer, :with_orders, qtty_orders: 5)
    expect(customer.orders.count).to eq(5)
  end
end
