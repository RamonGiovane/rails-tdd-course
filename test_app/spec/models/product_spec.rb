require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  ## SEM Shoulda Matchers
  # it 'is invalid without description' do
  #   product = build(:product, description: nil)
  #   product.valid?
  #   expect(product.errors[:description]).to include('can\'t be blank')
  # end

  context 'Validates' do
    ## COM Shoulda Marchers
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:category) }

    ### Sintaxe alternativa
    # it { is_expected.to validate_presence_of(:category)}
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
