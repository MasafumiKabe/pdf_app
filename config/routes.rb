Rails.application.routes.draw do
  root to: "receipts#new"
  resources :receipts, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :output
    end
  end
end
