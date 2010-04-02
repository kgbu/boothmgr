class CreateAttends < ActiveRecord::Migration
  def self.up
    create_table :attends do |t|
      t.references :game
      t.references :member
      t.string :prepok
      t.string :prepsignok
      t.string :signhelpok
      t.string :settledownok

      t.timestamps
    end
  end

  def self.down
    drop_table :attends
  end
end
