class AddFieldsToCourses < ActiveRecord::Migration[5.2]
  
  #add_column
  def change
    add_column :comments, :user_id, :bigint

  	add_column :matieres, :user_id, :bigint
  	add_column :matieres, :course_id, :bigint
  	
  	add_column :courses, :user_id, :bigint
  	add_column :courses, :matiere_id, :bigint
  	add_column :courses, :level_id, :bigint
  	
  	add_column :levels, :matiere_id, :bigint
  	add_column :levels, :course_id, :bigint
  	add_column :levels, :user_id, :bigint

  	add_column :classrooms, :user_id, :bigint
  	add_column :classrooms, :level_id, :bigint
  	add_column :classrooms, :course_id, :bigint


  end

  def change
    add_index :comments, :user_id, unique: true

    add_index :matieres, :course_id, unique: true
    add_index :matieres, :user_id, unique: true

    add_index :courses, :user_id, unique: true
    add_index :courses, :level_id, unique: true
    add_index :courses, :matiere_id, unique: true

    add_index :levels, :course_id, unique: true
    add_index :levels, :matiere_id, unique: true
    add_index :levels, :user_id, unique: true


  end
# references
  def change
    add_reference :comments, :user, foreign_key: true

    add_reference :matieres, :user, foreign_key: true
    add_reference :matieres, :course, foreign_key: true

    add_reference :courses, :matiere, foreign_key: true
    add_reference :courses, :user, foreign_key: true
    add_reference :courses, :level, foreign_key: true

    add_reference :levels, :user, foreign_key: true
    add_reference :levels, :course, foreign_key: true
    add_reference :levels, :matiere, foreign_key: true

  end
end
