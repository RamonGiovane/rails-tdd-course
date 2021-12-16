FactoryBot.define do
  factory :customer, aliases: [:user] do
    # Atributo transitorio, nao participa dos specs...
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }

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

    factory :customer_default, traits: [:default]
    factory :customer_vip, traits: [:vip]

    factory :customer_male_default, traits: [:male, :default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_male, traits: [:male]

    factory :customer_female_default, traits: [:female, :default]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_female, traits: [:female]

    # ...mas serve para realizar logicas como:
    after(:create) do |_customer, evaluator|
      Customer.name.upcase if evaluator.upcased
    end
  end
end
