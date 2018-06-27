class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :ordered,   -> { order(published_at: :desc) }
  scope :published, -> { where(draft: false).where('published_at < ?', Time.zone.now) }

  has_attached_file :cover, default_url: "/img/post/:style/missing.jpg", styles: {
                      desktop: '1200x675>',
                      tablet:  '768x432>',
                      mobile:  '400x225>'
                    }

  has_and_belongs_to_many :categories

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  validates :categories, :title, :body, :description, presence: true

  #Rails Admin
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
  end

end
