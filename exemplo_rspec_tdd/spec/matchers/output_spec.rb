describe 'Matcher output' do
  it { expect { puts 'Ramon' }.to output.to_stdout }
  it { expect { print 'Ramon' }.to output('Ramon').to_stdout }
  it { expect { puts 'Ramon' }.to output(/Ramon/).to_stdout }

  it { expect { warn 'Ramon' }.to output.to_stderr }
  it { expect { warn 'Ramon' }.to output(/Ramon/).to_stderr }
end
