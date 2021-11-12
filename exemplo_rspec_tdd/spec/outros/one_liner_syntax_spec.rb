describe (1..5), 'One liner syntax' do
  it '#is_expected' do
    # E possivel substituir isso:
    expect(subject).to cover(2)

    # Por isso:
    is_expected.to cover(2)
  end

  # One liner syntax: A descricao fica implicita
  it { is_expected.to cover(2) }
  it { is_expected.not_to cover(9) }
end
