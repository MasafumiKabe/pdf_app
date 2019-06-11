Rails.application.routes.draw do
  root to: "receipts#new"
  resources :receipts, only: [:index, :show, :new, :create, :destroy]
end
