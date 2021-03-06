  class JourneysController < ApplicationController
  def  new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.driver = current_driver
    @planet = Planet.where(name: @journey.arrival)
    @journey.photo =  @planet[0]['photo']
    if @journey.save
      redirect_to driver_path(current_driver)
    else
      render 'new'
    end
  end

  def show
    @journey = Journey.find(params[:id])
  end

  def index
    @journeys = Journey.all
  end

  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy
    redirect_to driver_path(current_driver)
  end

  private

  def journey_params
    params.require(:journey).permit(:departure, :arrival, :date, :price, :available_seats, :spaceship_name, :driver_id, :photo)
  end
end
