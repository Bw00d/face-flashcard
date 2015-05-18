class AddAvatarToFaces < ActiveRecord::Migration
  def self.up
    add_attachment :faces, :avatar
  end

  def self.down
    remove_attachment :faces, :avatar
  end
end
