class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.string :email,      null: false, default: ""
    	t.string :invite_code
    	t.integer :user_id
    	t.boolean :confirmed, default: false

      t.timestamps null: false
    end
  end
end
