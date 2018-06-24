class Post < ApplicationRecord
  scope :ordered, -> { order(published_at: :desc) }
  scope :published, -> { where(draft: false).where('published_at < ?', Time.zone.now) }

  has_attached_file :cover, default_url: "/images/:style/missing.png", styles: {
                      desktop: '1200x400>',
                      tablet:  '720x400>',
                      mobile:  '600x400>'
                    }

  has_and_belongs_to_many :categories

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  validates :categories, :title, :body, :description, presence: true

  rails_admin do
    configure :body, :ck_editor
    configure :published_at do
      strftime_format do
        '%d-%m-%Y %H:%M:%S'
      end
    end

  end

end
