require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds sucessfuly' do
    get :index
    # be_success é uma alias de:
    # expect(response). to have_http_status 200
    expect(response).to be_success
  end
end
