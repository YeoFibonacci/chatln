class AddCourseIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :course_id, :bigint
  end
end
