require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a Guest' do
    context '#index' do
      it 'responds sucessfuly' do
        get :index
        # be_success é uma alias de:
        # expect(response). to have_http_status 200
        expect(response).to be_success
      end
    end

    context '#show' do
      it 'responds 302 (not authorized)' do
        customer = create(:customer)
        get :show, params: { id: customer.id }

        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'as Logged Member' do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    context '#create' do

      # Usando shoulda-matchers para testar rotas
      it 'Route' do
        is_expected.to route(:get, '/customers').to(action: :index)
      end

      it 'Content-Type' do
        customer_params = attributes_for(:customer)
        sign_in @member

        post :create, format: :json, params: { customer: customer_params }
        expect(response.content_type).to eq('application/json')
      end

      it 'flash notice' do
        customer_params = attributes_for(:customer)
        sign_in @member

        post :create, params: { customer: customer_params }
        expect(flash[:notice]).to match(/Customer was successfully created/)
      end

      it 'with valid attributes' do
        customer_params = attributes_for(:customer)
        sign_in @member
        exp = expect do
          post :create, params: { customer: customer_params }
        end
        exp.to change(Customer, :count).by 1
      end
    end

    context '#show' do
      it 'responds sucessfuly' do
        sign_in @member
        get :show, params: { id: @customer.id }
        expect(response).to be_success
      end

      it 'renders :show template' do
        sign_in @member
        get :show, params: { id: @customer.id }
        expect(response).to render_template(:show)
      end
    end
  end
end
