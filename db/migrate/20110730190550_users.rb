class Users < ActiveRecord::Migration
  def self.up
    add_column :users, :measurement_units, :integer, :default => 0
    add_column :users, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :measurement_units
    remove_column :users, :measurement_units
  end
end
