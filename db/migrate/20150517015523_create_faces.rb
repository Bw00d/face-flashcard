class CreateFaces < ActiveRecord::Migration
  def change
    create_table :faces do |t|
    	t.string :name
    	t.string :agency

      t.timestamps null: false
    end
  end
end
