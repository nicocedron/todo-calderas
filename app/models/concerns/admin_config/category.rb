module AdminConfig::Category
  extend ActiveSupport::Concern

  included do
    rails_admin do
      field :posts do
        visible false
      end
    end
  end
end
