Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticated :admin do
    mount Ckeditor::Engine => '/ckeditor'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
