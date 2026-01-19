module AdminConfig::Category
  extend ActiveSupport::Concern

  included do
    rails_admin do
      # Esto define qué campos se muestran en TODAS las vistas
      configure :name do
        label "Nombre de la Categoría"
        required true
      end
      
      # Define el orden y qué campos aparecen
      list do
        field :name
        field :posts
      end
      
      edit do
        field :name
        field :posts
      end
    end
  end
end