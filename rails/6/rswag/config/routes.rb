Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1, defaults: {format: :json} do 
      resources :books, param: :id, only: %i[index create] do
        member do
          get    :index
          post   :create
        end
      end
    end
  end
end
