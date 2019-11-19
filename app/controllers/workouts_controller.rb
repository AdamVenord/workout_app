class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update]
  
  def index
    @workouts = current_user.workouts 
  end
  
  def show
  end
  
  def new
    @workout = Workout.new
  end
  
  def create 
    @workout = current_user.workouts.new(workout_params)
      if @workout.save
        flash[:success] = "Workout Created"
        redirect_to workouts_path
      else
        flash[:error] = "Error #{@workout.errors.full_messages.join("\n")}"
        render :new
      end
  end
  
  def edit
  end
  
  def update
    if @workout.update(workout_params)
      redirect_to workouts_path
    else
      render :edit
    end
  end
  
  def destroy
    @workout.destroy
    redirect_to workouts_path
  end
  
  private
    def workout_params
      params.require(:workout).permit(:name, :time)
    end
  
    # don't just find by the workout model or you may potentially be able to view other users workouts
    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end
  
end
