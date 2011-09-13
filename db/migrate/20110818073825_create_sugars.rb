class CreateSugars < ActiveRecord::Migration
  def self.up
    create_table :sugars do |t|
      t.integer :item_id, :null => false
      t.binary :salt, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sugars
  end
end
