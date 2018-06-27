Rails.application.routes.draw do

  #Admin
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticated :admin do
    mount Ckeditor::Engine => '/ckeditor'
  end

  #Web
  resources :articles, only: [:index, :show], path: I18n.t('routes.articles.path')
  root 'home#index'

end
