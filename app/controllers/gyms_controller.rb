class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
     @gyms = policy_scope(Gym).order(created_at: :desc)
    #@gyms =  Gym.all with pundit the index method in the controller you're using pundit change a bit
  end




  def show
    #@gym = Gym.find(params[:id])

  end

  def new
    @gym = Gym.new
    authorize @gym

  end

  def edit
    #esta linea la hemos sustituido por set_gym method
   # @gym = Gym.find(params[:id])

  end

  def create
    @gym =  Gym.new(gym_params)
    @gym.save
    @gym.user = current_user
    authorize @gym

    if @gym.save
      redirect_to @gym, notice: 'your gym was create,thanks!'
    else
      render :new
    end
  end

  def upadate
    #@gym = Gym.find(params[:id])
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

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym

  end

  def gym_params
    params.require(:gym).permit(:name, :description, :pricing, :user_id, :photo)

  end
end
