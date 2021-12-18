FactoryBot.define do
  factory :customer, aliases: [:user] do
    # Atributo transitorio, nao participa dos specs...
    transient do
      upcased { false }
      qtty_orders 3
    end

    name { Faker::Name.name }
    # email { Faker::Internet.email }

    # Usando Sequence para criar email
    # Toda vez que se chamar customer.email, n tera o proximo valor
    # Por padrao o valor inicial e 1, mas pode ser qualquer numero ou objecto que implemente o metodo next.
    sequence(:email) { |n| "meu-email=#{n}" }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtty_orders, customer: customer)
      end
    end
    factory :customer_default, traits: [:default]
    factory :customer_vip, traits: [:vip]

    factory :customer_male_default, traits: [:male, :default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_male, traits: [:male]

    factory :customer_female_default, traits: [:female, :default]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_female, traits: [:female]

    factory :customer_with_orders, traits: [:with_orders]
    # ...mas serve para realizar logicas como:
    after(:create) do |_customer, evaluator|
      Customer.name.upcase if evaluator.upcased
    end
  end
end
