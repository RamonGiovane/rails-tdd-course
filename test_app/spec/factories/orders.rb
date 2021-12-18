FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}"}
    
    # Podemos especificar explicitamente qual a fabrica para a associacao customer
    # association :customer, factory: :customer

    # Ou deixar que o FactoryBot infira.
    customer
  end
end
