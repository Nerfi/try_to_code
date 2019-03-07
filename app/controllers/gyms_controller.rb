class GymsController < ApplicationController

  def index
    @gyms =  Gym.all

  end

  def show
    @gym = Gym.find(paramas[:id])

  end

  def new
    @gym = Gym.new

  end

  def edit
    @gym = Gym.find(params[:id])

  end

  def create
    @gym =  Gym.new(params[:gym])
    @gym.save

  end

  def upadate
    @gym = Gym.find(params[:id])
    @gym.update(params[:gym])

  end
end
