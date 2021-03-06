module V1
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy ]
    before_action :authenticate_user!

    # GET /products
    # GET /products.json
    def index
      @products = Product.all
    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)
      @product.user_id = @current_user.id
      @product.type = "Products::#{@product.category}"
      @product.parent = get_parent if params[:parent_id].present?

      if @product.save
        render :create, status: :created, locals: { product: @product  }
        #render :show, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      if @product.update(product_params)
        render :show, status: :ok, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.

      def get_parent
        Product.find_by_id(params[:parent_id])
      end

      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.permit(:name, :alias, :desc, :category, :parent_id, :durable, :durability, :convenient, :resaleable, :industrial, :internal_trade, :active, :user_id)
      end
  end
end
