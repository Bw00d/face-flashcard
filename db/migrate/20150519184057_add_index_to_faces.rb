class AddIndexToFaces < ActiveRecord::Migration
  def change
  	add_index :faces, :name
  end
end
