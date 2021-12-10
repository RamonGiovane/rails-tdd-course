Rspec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end

  # Nao obrigatorio, mas e possivel customizar a mensagem descritiva
  description do |_|
    "be a multiple of #{expected}"
  end

  # Nao obrigatorio, mas e possivel customizar a mensagem de erro
  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end
end
describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3) }
end
