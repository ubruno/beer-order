class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def order
    @order = Order.new
    @order.beer = Beer.find(params[:beer_id])
    
    #@order.beer = @beer
    render :new
  end
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def list
    @orders = Order.eager_load(:beer)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)    
    @order.beer = Beer.find(params[:order_beer_id])
    @order.status = 'NEW'

    sum = @order.beer.available_quantity - @order.quantity
   
    respond_to do |format|
       if @order.beer.available_quantity <= 0
         format.html { redirect_to @order, notice: 'Ops! Estoque esgotado :(' }
       elsif sum >= 0
          @order.beer.available_quantity = sum
          if @order.save && @order.beer.save
            logger.info "New order was created"
            format.html { redirect_to @order, notice: 'Pedido feito com sucesso, obrigado!' }
            format.json { render :show, status: :created, location: @order }
          else
            format.html { render :new }
            format.json { render json: @order.errors, status: :unprocessable_entity }
         end
       else 
	   format.html { redirect_to @order, notice: 'Ops! Seu pedido é maior que a quantidade que temos disponíveis :(' }
       end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :email, :phone_number, :delivery_address, :quantity, :status, :beer)
    end
end
