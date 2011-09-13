class CreateBelongings < ActiveRecord::Migration
  def self.up
    create_table :belongings do |t|
      t.integer :folder_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :belongings
  end
end
