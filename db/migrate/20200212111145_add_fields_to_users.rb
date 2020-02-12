class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :username, :string
    add_column :users, :contact, :string
    add_column :users, :city, :string
    add_column :users, :school_name, :string
    add_column :users, :status, :string
    add_column :users, :resume, :string
    add_column :users, :gender, :string
    add_column :users, :matricule, :string
    add_column :users, :matiere_shared, :string
    add_column :users, :classroom_id, :bigint
    add_column :users, :level_id, :bigint
    add_column :users, :avatar, :string
    add_column :users, :slug, :string
    add_column :users, :terms, :boolean
  end
end
