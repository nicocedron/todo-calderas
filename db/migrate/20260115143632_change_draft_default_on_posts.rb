class ChangeDraftDefaultOnPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :draft, false
  end
end
