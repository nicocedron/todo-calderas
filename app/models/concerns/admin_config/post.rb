module AdminConfig::Post
  extend ActiveSupport::Concern

  included do

    rails_admin do
      configure :body, :ck_editor
      configure :published_at do
        strftime_format do
          '%d-%m-%Y %H:%M:%S'
        end
      end

      list do
        exclude_fields :body
      end

      edit do
        exclude_fields :slug
      end
    end

  end
end
