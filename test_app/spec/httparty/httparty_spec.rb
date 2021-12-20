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

  it 'content-type (with different url and same body))',
     vcr: { cassette_name: 'jsonplaceholder/posts/', match_requests_on: [:body] } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4, 5].sample}")
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end
end
