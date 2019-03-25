class Slide < ApplicationRecord
  scope :ordered, -> { order(position: :asc) }

  has_attached_file :image, default_url: "/img/slider/:style/missing.jpg",
                    styles: {
                      desktop: ['1200x400>', :jpg],
                      tablet:  ['720x400>',  :jpg],
                      mobile:  ['600x400>',  :jpg]
                    },
                    convert_options: {
                        desktop: '-quality 75',
                        tablet:  '-quality 75',
                        mobile:  '-quality 75'
                    }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :body, :url, :position, presence: true
end
