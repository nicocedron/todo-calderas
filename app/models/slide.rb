class Slide < ApplicationRecord
  scope :ordered, -> { order(position: :asc) }

   has_attached_file :image,
                      storage: :ftp,
                      default_url: "/img/slider/:style/missing.jpg",
                      path: '/img/slider/:id/:style/:basename.:extension',
                      url: ':host/img/slider/:id/:style/:basename.:extension',
                     styles: {
                       desktop: ['1200x400>', :jpg],
                       tablet:  ['720x400>',  :jpg],
                       mobile:  ['600x400>',  :jpg]
                     },
                     convert_options: {
                         desktop: '-quality 75',
                         tablet:  '-quality 75',
                         mobile:  '-quality 75'
                     },
                     ftp_servers: [
                       {
                         host: ENV['FTP_HOST'] || 'ftp.example.com',
                         user: ENV['FTP_USER'] || 'username',
                         password: ENV['FTP_PASSWORD'] || 'password',
                         passive: true
                       }
                     ]

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :body, :url, :position, presence: true
end
