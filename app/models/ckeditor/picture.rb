class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                     storage: :ftp,
                     path: '/post_assets/pictures/:id/:style_:basename.:extension',
                     url: '/post_assets/pictures/:id/:style_:basename.:extension',
                     styles: { content: '800>', thumb: '118x100#' },
                     ftp_servers: [
                       {
                         host: ENV['FTP_HOST'] || 'ftp.example.com',
                         user: ENV['FTP_USER'] || 'username',
                         password: ENV['FTP_PASSWORD'] || 'password',
                         passive: true
                       }
                     ]

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end
