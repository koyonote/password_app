class CreateGroupings < ActiveRecord::Migration
  def self.up
    create_table :groupings do |t|
      t.integer :group_id
      t.integer :folder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :groupings
  end
end
