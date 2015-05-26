class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.text    :message
      t.boolean :fixed, default: false

      t.timestamps
    end
  end
end
