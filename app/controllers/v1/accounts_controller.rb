module V1
  class AccountsController < ApplicationController
    before_action :set_account, only: %i[ show update destroy ]
    before_action :authenticate_user!

    # GET /accounts
    # GET /accounts.json
    def index
      #@accounts = Account.all
      @accounts = Current.user.accounts
    end

    # GET /accounts/1
    # GET /accounts/1.json
    def show
      load_current_account!
    end

    # POST /accounts
    # POST /accounts.json
    def create
      @account = Account.new(account_params)
      @account.user_id = @current_user.id

      if @account.save
        render :create, status: :created, locals: { account: @account  }
        #render :show, status: :created, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /accounts/1
    # PATCH/PUT /accounts/1.json
    def update
      if @account.update(account_params)
        render :show, status: :ok, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    # DELETE /accounts/1
    # DELETE /accounts/1.json
    def destroy
      @account.destroy
    end

    private

      def load_current_account!
        Current.account = @account if Current.user.accounts.include? @account
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def account_params
        params.permit(:accountable_id, :accountable_type, :type, :name, :contacts, :memo, :active, :user_id)
      end
  end
end
