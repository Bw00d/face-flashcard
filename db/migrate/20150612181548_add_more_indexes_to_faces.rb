class AddMoreIndexesToFaces < ActiveRecord::Migration
  def change
  	add_index :faces, :agency
  	add_index :faces, :position
  end
end
