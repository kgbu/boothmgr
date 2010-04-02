class AddDefaultToGame < ActiveRecord::Migration
  def self.up
    change_column :games, :homeaway, :string, :default => "home"
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
