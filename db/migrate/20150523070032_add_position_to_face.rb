class AddPositionToFace < ActiveRecord::Migration
  def change
  	add_column :faces, :position, :string
  end
end
