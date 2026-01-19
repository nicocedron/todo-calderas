module AdminConfig::Category
  extend ActiveSupport::Concern

  included do
    rails_admin do
      # Configuración para la vista de LISTA
      list do
        field :id
        field :name do
          label "Nombre"
        end
        field :posts_count do
          label "Artículos"
          # Esto mostrará el conteo de artículos relacionados
          pretty_value do
            bindings[:object].posts.count
          end
        end
        field :created_at do
          label "Creado"
        end
      end
      
      # Configuración para la vista de EDICIÓN/CREACIÓN
      edit do
        field :name do
          label "Nombre de la categoría"
          required true  # Marca como campo obligatorio
        end
        field :posts do
          label "Artículos asociados"
          # Esto hará que aparezca como lista seleccionable
          associated_collection_scope do
            Proc.new { |scope|
              # Puedes ordenar los artículos por fecha de publicación
              scope = scope.published.order(published_at: :desc)
            }
          end
        end
      end
      
      # Configuración para la vista de DETALLE
      show do
        field :name
        field :posts
        field :created_at
        field :updated_at
      end
    end
  end
end