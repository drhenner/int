Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login'       => 'users#new'

  resources  :shopping_carts do
    member do
      put :add_address
      put :add_shipping_address
      get :purchase
    end
  end

  resources  :products do
    member do
      put :types
    end
  end
end
