class Slide < ApplicationRecord
  scope :ordered, -> { order(position: :asc) }
  has_attached_file :image, default_url: "/img/slider/:style/missing.jpg",
                    styles: {
                      desktop: '1200x400>',
                      tablet:  '720x400>',
                      mobile:  '600x400>'
                    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :body, :url, :position, presence: true


  rails_admin do
    include_all_fields
    field :body, :ck_editor
  end
end
