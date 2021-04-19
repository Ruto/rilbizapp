module V1
  class PricesController < ApplicationController
    before_action :set_price, only: %i[ show update destroy ]
    before_action :authenticate_user!

    # GET /prices
    # GET /prices.json
    def index
      @prices = Price.all
    end

    # GET /prices/1
    # GET /prices/1.json
    def show
    end

    # POST /prices
    # POST /prices.json
    def create
      @price = Price.new(price_params)
      @price.user_id = @current_user.id

      if @price.save
        render :create, status: :created, locals: { price: @price  }
        #render :show, status: :created, location: @price
      else
        render json: @price.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /prices/1
    # PATCH/PUT /prices/1.json
    def update
      if @price.update(price_params)
        render :show, status: :ok, location: @price
      else
        render json: @price.errors, status: :unprocessable_entity
      end
    end

    # DELETE /prices/1
    # DELETE /prices/1.json
    def destroy
      @price.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_price
        @price = Price.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def price_params
        params.permit(:priceable_id, :priceable_type, :type, :code_id, :amount, :active, :user_id)
      end
  end
end
