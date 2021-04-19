Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do

    resources :structures do
          resources :incomes, :prices, :expenses, :indirect_expenses, :adminstrative_costs, :product_sales,
          :product_expenses, :quantities, :total_sale, :products, :controller => 'structures', :except => [:destroy, :edit, :update ]
    end

    resources :organizations do
           resources :company, :department, :sub_department, :holding_company, :product_group,
           :product, :service_group, :service, :controller => 'organizations', :except => [:destroy, :edit, :update]
    end

    resources :products do
      resources :good, :service, :controller => 'products', :except => [:destroy, :edit, :update]
    end

    resources :codes

    resources :prices do
      resources :budget_price, :invoice_price, :purchase_price, :quotation_price, :sales_price, :except => [:destroy, :edit, :update] 
    end

    resources :users, only: [:create, :show]  do
       collection do
         get  'unconfirmed_users'
         post 'confirm_token'
         post 'login'
         post 'forgot_password'
         post 'reset_password'
       end
     end

   end


end
