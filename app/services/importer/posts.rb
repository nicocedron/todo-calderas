class Importer::Posts < Importer::Base
  include ActionView::Helpers::SanitizeHelper

  class_name 'Post'
  fields [{published_at: 1, title: 4, body: 5, views: 6}]
  destroy_before_import false


  def create(record)
    record.published_at = Time.zone.parse(record.published_at)
    record.category_ids = [Category.first.id]
    record.description  = strip_tags(record.body).truncate(250)
    image = /<img.*src="((?!http:\/\/)\S+)".*>/.match(record.body)[1] rescue nil

    puts image.inspect
    if image &&
      !image.include?('.swf') &&
      !image.include?('[') &&
      !image.include?('base64')

      record.cover = image.include?('http') ? image : "http://todocalderas.com.ar#{image}"

    elsif image&.include?('base64')
      image = Paperclip.io_adapters.for(image)
      image.original_filename = "something.jpg"
      record.cover = image
    end

    record.body.gsub! '/navegador/', 'http://assets.todocalderas.com.ar/'

    class_name.create( record.to_h )
  end
end
