class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  has_attached_file :cover, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  validates :categories, :title, :body, :description, presence: true
  rails_admin do
    include_all_fields
    field :body, :ck_editor
  end
end
