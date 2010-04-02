class AddZenzaToAttend < ActiveRecord::Migration
  def self.up
    add_column :attends, :zenzaok, :string
    add_column :attends, :kaigiok, :string
    add_column :attends, :extraok, :string
  end

  def self.down
    remove_column :attends, :extraok
    remove_column :attends, :kaigiok
    remove_column :attends, :zenzaok
  end
end
