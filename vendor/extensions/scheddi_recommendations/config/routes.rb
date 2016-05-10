Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :scheddi_recommendations do
    resources :scheddi_recommendations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :scheddi_recommendations, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :scheddi_recommendations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
