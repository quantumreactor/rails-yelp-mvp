Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   Prefix  Verb    URI Pattern            Controller#Action
#   restaurants  GET     /restaurants           restaurants#index
#                POST    /restaurants           restaurants#create
# new_restaurant  GET     /restaurants/new       restaurants#new
# edit_restaurant  GET     /restaurants/:id/edit  restaurants#edit
#    restaurant  GET     /restaurants/:id       restaurants#show
#                PATCH   /restaurants/:id       restaurants#update
#                DELETE  /restaurants/:id       restaurants#destroy
  resources :restaurants do
    #collection do
    #end
    #member do
    #  get :review
    #end
    resources :reviews, only: [ :create, :destroy, :update ]
  end
  resources :reviews
end
