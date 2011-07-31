class CarsController < ApplicationController

  def index
    @cars = current_user.cars
  end
  
  def new
    @car = current_user.cars.new
  end
  
  def show
    id = params.has_key?(:format) ? params[:format] : params[:id]
    load_car(id)
  end

  def create
    @car = current_user.cars.create!(params[:car])
    
    # now we've created the car simply redirect to the calculator page
    redirect_to car_path(@car)
  end

  def destroy
    load_car(params[:id])
    @car.destroy
    redirect_to root_path, :flash => { :success => "Car deleted!" }
  end
  
private
  def load_car(id)
    @car = current_user.cars.find(id)
  end
end
