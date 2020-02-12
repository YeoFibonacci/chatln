class CreateMatieres < ActiveRecord::Migration[5.2]
  def change
    create_table :matieres do |t|
      t.string :matiere
      t.string :slug

      t.timestamps
    end
  end
end
