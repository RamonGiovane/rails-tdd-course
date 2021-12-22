describe '::HTTParty' do
  it 'content-type', :vcr do
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2')
    #   .to_return(status: 200, body: '', headers: { 'content-type': 'application/json;', 'charset': 'utf-8' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end

  # Podemos informar o cassette-name
  it 'content-type (with cassette name)', vcr: { cassette_name: 'jsonplaceholder/posts' } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end

  # O padrao e record: once, que grava um record apenas uma vez, so funciona com a mesma url 
  # para o mesmo cassete_name
  # record: new_episodes grava um novo episodio a cada url
  # record: none garante que nunca serao feitas requisicoes
  # record: all faz uma nova requisicao a cada chamada
  it 'content-type (vcr new episodes))',
     vcr: { cassette_name: 'jsonplaceholder/posts/', record: :new_episodes } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/10')
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end

  # Podemos usar urls diferentes desde que estabelecamos outra regra para o match,
  # por exemplo que as requisicoes tenham o mesmo corpo, com match_requests_on: [:body]
  it 'content-type (with different url and same body))',
     vcr: { cassette_name: 'jsonplaceholder/posts/', match_requests_on: [:body] } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4, 5].sample}")
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end
end
