# db/migrate/xxxx_rename_course_id_to_post_id_in_comments.rb
class RenameCourseIdToPostIdInComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :course_id, :post_id
  end
end