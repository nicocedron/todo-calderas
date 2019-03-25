module AdminConfig::Admin
  extend ActiveSupport::Concern

  included do

    rails_admin do
      weight -11
      edit do
        field :email
        field :password
      end
      list do
        field :id
        field :email
        field :sign_in_count
        field :last_sign_in_at
      end
    end

  end
end
