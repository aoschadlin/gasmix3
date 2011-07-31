class Users < ActiveRecord::Migration
  def self.up
    add_column :users, :measurement_units, :integer, :default => 0
  end

  def self.down
    remove_column :users, :measurement_units
  end
end
