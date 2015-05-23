class RenameInviteColumns < ActiveRecord::Migration
  def change
  	rename_column :invitations, :email, :recipient_email
  	rename_column :invitations, :user_id, :sender_id
  	rename_column :invitations, :invite_code, :token
  end
end
