class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params_controller)

    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def params_controller
    params.require(:customer).permit(:id, :name, :email, :phone, :avatar, :smoker)
  end
end
