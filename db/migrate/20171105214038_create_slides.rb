class CreateSlides < ActiveRecord::Migration[5.1]
  def change
    create_table :slides do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :position, default: 9999
      t.attachment :image

      t.timestamps
    end
  end
end
