class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    @gyms = Gym.where.not(latitude: nil, longitude: nil)
    @markers = @gyms.map do |gym|
      {
        lng: gym.longitude,
        lat: gym.latitude,
        #ojo con el comment de la liinea 11 para un futuro puede que lo necesite
       # infoWindow: render_to_string(partial:"/flats/map_box", locals: {flat: flat})
      }
    end
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
      redirect_to @gym , notice: 'your gym was created thanks!'
    else
      render :new
    end
  end

  def update
    #@gym = Gym.find(params[:id])
    #@gym.update(params[:gym])
    @gym.update(gym_params)

    if @gym.update(gym_params)
      redirect_to @gym, notice: 'your gym was updated, thanks!'
    else
      render :edit
  end
end

  def destroy
    #wacth out with this method
    @gym.destroy
    redirect_to gyms_path

  end

  private

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym

  end

  def gym_params
    params.require(:gym).permit(:name, :description, :pricing, :user_id, :photo, :address)

  end
end
