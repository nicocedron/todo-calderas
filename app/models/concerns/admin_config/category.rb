module AdminConfig::Category
  extend ActiveSupport::Concern

  included do

    rails_admin do
      configure :posts do
        visible false
      end
    end

  end
end
