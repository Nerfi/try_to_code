class GymsController < ApplicationController

  def index
    @gyms =  Gym.all

  end

  def show
    @gym = Gym.find(paramas[:id])

  end

  def new
    @gym = Gym.new
    authorize @gym

  end

  def edit
    @gym = Gym.find(params[:id])

  end

  def create
    @gym =  Gym.new(params[:gym])
    @gym.save
    @gym.user = current_user

    if @gym.save
      redirect_to @gym, notice: 'your gym was create,thanks!'
    else
      render :new
    end
  end

  def upadate
    @gym = Gym.find(params[:id])
    @gym.update(params[:gym])

    if @gym.update(gym_params)
      redirect_to @gym, notice: 'your gym was updated, thanks!'
    else
      render :edit
  end
end

  def destroy
    #wacth out with this method
    @gym.destroy
    redirect_to :gyms_path

  end

  private

  def gym_params
    params.require(:gym).permit(:name, :description, :pricing, :user_id)

  end
end
