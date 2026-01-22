class AddPostToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
