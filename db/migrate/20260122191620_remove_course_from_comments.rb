class RemoveCourseFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :course, index: true, foreign_key: false
  end
end
