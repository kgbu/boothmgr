class AddDefaultToAttend < ActiveRecord::Migration
  def self.up
    change_column :attends, :prepok, :string, :default => "○"
    change_column :attends, :prepsignok, :string, :default => "○"
    change_column :attends, :zenzaok, :string, :default => "○"
    change_column :attends, :signhelpok, :string, :default => "○"
    change_column :attends, :settledownok, :string, :default => "○"
    change_column :attends, :kaigiok, :string, :default => "○"
    change_column :attends, :extraok, :string, :default => "○"
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
