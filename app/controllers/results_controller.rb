class ResultsController < ApplicationController
  def result
    @title = "Result"

    # Read form details
    name            = params[:car][:name]
    tank_size       = params[:car][:tank_size].to_f
    existing_octane = params[:car][:existing_octane].to_f
    existing_amount = params[:car][:existing_amount].to_f
    @base_octane    = params[:car][:base_octane].to_f
    base_amount     = params[:car][:base_amount].to_f
    @boost_octane   = params[:car][:boost_octane].to_f
    boost_amount    = params[:car][:boost_amount].to_f
    @target_octane  = params[:car][:target_octane].to_f

    total_energy    = @target_octane * tank_size
    existing_energy = existing_octane * existing_amount
    required_energy = total_energy - existing_energy
    fill_amount     = tank_size - existing_amount

    # Calculate result and store details for rendering
    @amount_to_fill = "%.1f" % ((required_energy - (@base_octane * fill_amount)) / (@boost_octane - @base_octane))
    
    # Store details for future calculations
    attr = {
      :name => name,
      :tank_size => tank_size,
      :last_base_octane => @base_octane,
      :last_boost_octane => @boost_octane,
      :last_target_octane => @target_octane
    }
    current_user.cars.find(params[:id]).update_attributes(attr)
  end
end
