describe 'Matchers de comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 2
    expect(5).to be >= 5
  end


  it 'be between' do
    expect(5).to be_between(2, 7).inclusive
    expect(5).not_to be_between(2, 4).inclusive
  end
  
  it 'be between' do
    expect(5).to be_between(2, 7).exclusive
    expect(5).not_to be_between(2, 5).exclusive
  end

  it 'match' do
    expect('teste@teste.com').to match(/..@../)
  end

  it 'start with' do
    expect('fulano de tal').to start_with('fulano')
    expect([1,2,3]).to start_with(1)
  end

  it 'end with' do
    expect('fulano de tal').to end_with('tal')
    expect([1,2,3]).to end_with(3)
  end

end