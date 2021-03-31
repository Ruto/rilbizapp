Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do

    resources :structures do
      namespace :structures do
          resources :incomes, :prices, :expenses, :indirect_expenses, :adminstrative_costs, :product_sales,
          :product_expenses, :quantities, :total_sale, :products, :controller => 'structures', :except => [:destroy, :edit, :update ]
      end
    end

    resources :organizations do
      namespace :organizations do
           resources :company, :department, :sub_department, :holding_company, :product_group,
           :product, :service_group, :service, :controller => 'organizations', :except => [:destroy, :edit, :update]
      end
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
