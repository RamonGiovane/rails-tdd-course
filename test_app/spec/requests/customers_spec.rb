require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'works! 200 OK' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'show - JSON 200 OK (RSPEC puro)' do
      get '/customers/248166291.json'
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response_body.fetch('id')).to be_kind_of(Integer)
      expect(response_body.fetch('name')).to be_kind_of(String)
    end


    it 'index - JSON 200 OK' do
      get '/customers.json'
      expect(response.body).to include_json([
                                              id: /\d/,
                                              name: (be_kind_of String),
                                              email: (be_kind_of String)
                                            ])
    end


    it 'show - JSON 200 OK' do
      get '/customers/248166291.json'
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(id: /\d+/)
    end

    it 'JSON - Schema' do
      customer = Customer.last
      get "/customers/#{customer.id}.json"
      expect(response).to match_response_schema('customer')
    end
  end

  describe 'POST/customers' do
    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }

      customers_params = attributes_for(:customer)

      post '/customers.json', params: { customer: customers_params }, headers: headers

      puts customers_params
      expect(response.body).to include_json({
                                              id: /\d/,
                                              name: customers_params[:name],
                                              email: customers_params[:email]
                                            })
    end

    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }

      customer = Customer.last
      customer.name += ' - UPDATED'

      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

      puts response.body
      expect(response.body).to include_json(
        id: /\d/,
        name: customer.name,
        email: customer.email
      )
    end

    it 'destroy - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }

      customer = Customer.last

      expect { delete "/customers/#{customer.id}.json", headers: headers }.to change(Customer, :count).by(-1)

      expect(response).to have_http_status(204)
    end
  end
end
