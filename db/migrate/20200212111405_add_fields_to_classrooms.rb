class AddFieldsToClassrooms < ActiveRecord::Migration[5.2]
  def change
  	add_column :classrooms, :user_id, :bigint
  	add_column :classrooms, :level_id, :bigint
  	add_column :classrooms, :course_id, :bigint

  end
end
