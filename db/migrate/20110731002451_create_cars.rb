class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      
      t.string  :name
      t.float   :tank_size
      t.integer :user_id
      t.float   :last_base_octane, :default => 0.0
      t.float   :last_boost_octane, :default => 0.0
      t.float   :last_target_octane, :default => 0.0

      t.timestamps
    end
    
    add_index :cars, :user_id
  end

  def self.down
    drop_table :cars
  end
end
