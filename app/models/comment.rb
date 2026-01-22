class Comment < ApplicationRecord
  # Cambiamos de post a course
  belongs_to :course

  validates :name, :email, :body, presence: true
end
