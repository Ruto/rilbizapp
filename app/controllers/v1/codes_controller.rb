module V1
  class CodesController < ApplicationController
    before_action :set_code, only: %i[ show update destroy ]
    before_action :authenticate_user!

    # GET /codes
    # GET /codes.json
    def index
      @codes = Code.all
    end

    # GET /codes/1
    # GET /codes/1.json
    def show
    end

    # POST /codes
    # POST /codes.json
    def create
      @code = Code.new(code_params)
      @code.user_id = @current_user.id

      if @code.save
        render :create, status: :created, locals: { code: @code  }
        #render :show, status: :created, location: @code
      else
        render json: @code.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /codes/1
    # PATCH/PUT /codes/1.json
    def update
      if @code.update(code_params)
        render :show, status: :ok, location: @code
      else
        render json: @code.errors, status: :unprocessable_entity
      end
    end

    # DELETE /codes/1
    # DELETE /codes/1.json
    def destroy
      @code.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_code
        @code = Code.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def code_params
        params.permit(:alias, :cost_code, :barcode, :system_code, :product_id, :codable_id, :codable_type, :active, :user_id)
      end
  end
end
