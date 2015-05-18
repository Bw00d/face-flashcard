class AddCreatedByToFaces < ActiveRecord::Migration
  def change
  	add_column :faces, :created_by, :integer
  	add_column :faces, :edited_by, :integer
  end
end
