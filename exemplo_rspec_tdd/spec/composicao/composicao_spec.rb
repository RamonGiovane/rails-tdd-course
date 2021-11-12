describe 'Ruby on Rails' do
  it { is_expected.to start_with('Ruby').and end_with('Rails') }
  it { expect(fruta_aleatoria).to eq('banana').or eq('laranja').or eq('uva') }

  # fruta_aleatoria e um Helper Method Arbitrario
  # E quando definimos metodos helpers no mesmo arquivo do teste.
  # O ideal e mover para um Helper Method de Modulo
  # Portanto, #fruta_aleatoria foi movido para hlepers/helper.rb
  # Para isso foi preciso configurar o spec_helpers.rb
  # def fruta_aleatoria
  #   %w[banana laranja uva].sample
  # end
end
