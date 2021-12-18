require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 pedido' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos' do
    # Para criar varios objetos com FactoryBot.
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)

    # Podemos tambem sobrescrever os atributos
    orders = create_list(:order, 3, description: 'Sobrescrevendo...')
    expect(orders.count).to eq(3)
  end
end
