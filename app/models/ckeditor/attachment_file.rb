class Ckeditor::AttachmentFile < Ckeditor::Asset
   has_attached_file :data,
                      storage: :ftp,
                      path: '/post_assets/attachments/:id/:filename',
                      url: ':host/post_assets/attachments/:id/:filename',
                     ftp_servers: [
                       {
                         host: ENV['FTP_HOST'] || 'ftp.example.com',
                         user: ENV['FTP_USER'] || 'username',
                         password: ENV['FTP_PASSWORD'] || 'password',
                         passive: true
                       }
                     ]
  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
