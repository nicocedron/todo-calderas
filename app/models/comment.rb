class Comment < ApplicationRecord
  belongs_to :post
  validates :name, :email, :body, presence: true

end
