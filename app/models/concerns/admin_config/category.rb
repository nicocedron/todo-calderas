module AdminConfig::Category
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name do
          required true
        end
      end

      list do
        field :name
        field :created_at
      end

      field :posts do
        visible false
      end
    end
  end
end
