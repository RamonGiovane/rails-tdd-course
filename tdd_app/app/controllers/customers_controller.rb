class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new
    end
  end

  def show
    set_customer
  end

  def edit
    set_customer
  end

  def update
    set_customer

    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: 'Cliente atualizado com sucesso!'
    else
      render :edit
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :phone, :avatar, :smoker)
  end
end
