class JourneysController < ApplicationController
  def  new
    @journey = Journey.new
  end

  def create
    driver = current_driver
    @journey = Journey.new(journey_params)
    @journey.driver = driver
    if @journey.save
      redirect_to journeys_path
    else
      render 'new'
    end
  end

  def index
    @journeys = Journey.all
  end

  private

  def journey_params
    params.require(:journey).permit(:departure, :arrival, :date, :price, :available_seats, :spaceship_name, :driver_id)
  end
end
