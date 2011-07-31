class Car < ActiveRecord::Base
  attr_accessor :existing_octane, :existing_amount,
                :base_octane, :base_amount,
                :boost_octane, :boost_amount,
                :target_octane

  attr_accessible :tank_size, :name, :user_id, :last_base_octane, :last_boost_octane, :last_target_octane

  belongs_to :user

  validates :tank_size, :presence => true,
                        :numericality => true
  validates_numericality_of :tank_size, :greater_than => 0.0

  validates :name, :presence => true
  validates :user_id, :presence => true

end
