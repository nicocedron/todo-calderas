class AddCourseToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :course, index: true
  end
end
