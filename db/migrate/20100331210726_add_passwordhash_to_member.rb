class AddPasswordhashToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :passwordhash, :string
    add_column :members, :salt, :string
    add_column :members, :isadmin, :boolean, :default => false
  end

  def self.down
    remove_column :members, :passwordhash
    remove_column :members, :salt
    remove_column :members, :isadmin
  end
end
