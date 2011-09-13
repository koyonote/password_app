class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :folder_id, :null => false
      t.string :name, :null => false
      t.string :account
      t.binary :encrypted_password, :null => false
      t.text :url
      t.integer :deleted, :default => false, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
