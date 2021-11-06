describe Array.new([1,2,3]) do
  it '#include' do
    expect(subject).to include(2)
    expect(subject).to include(1,2)
  end
  
  it '#match_array/#contain_exactly' do
    expect(subject).to contain_exactly(1,2,3)
    expect(subject).to match_array([1,2,3])
  end
end