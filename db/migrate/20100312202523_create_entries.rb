class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :member
      t.string :email
      t.string :prep
      t.string :prepsign
      t.string :signhelp
      t.string :settledown

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
