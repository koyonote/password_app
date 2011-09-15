class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :hashed_password, :null => false
      t.string :salt, :null => false
      t.string :name, :null => false
      t.integer :role, :default => 2
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
