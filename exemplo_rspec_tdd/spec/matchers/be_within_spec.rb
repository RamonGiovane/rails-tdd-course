describe 'be_within' do
  # 12.5 esta no intervalo de 12 - 0.5 a 12 + 0.5?
  it { expect(12.5).to be_within(0.5).of(12) }

  # 12.6 esta no intervalo de 12 - 0.5 a 12 + 0.5?
  it { expect(12.6).not_to be_within(0.5).of(12) }

  # 11.9 esta no intervalo de 12 - 0.5 a 12 + 0.5?
  it { expect(11.9).to be_within(0.5).of(12) }
end
