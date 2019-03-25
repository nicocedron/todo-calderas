module AdminConfig::Slide
  extend ActiveSupport::Concern

  included do

    rails_admin do
      include_all_fields
      field :body, :ck_editor
    end

  end
end
