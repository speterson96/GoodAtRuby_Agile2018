class SaveStateController < ApplicationController
  before_action :set_title
  before_action :index 
  
  def set_title
    @title = "Saves"
  end
  
  # GET /scores
  # GET /scores.json
  def index
    @save_state = SaveState.all 
  end
  
  def create
    userDiff = params[:user_difficulty]   
    userScore = params[:user_score]
    userBullets = params[:user_bullets]
    userLives = params[:user_lives]
    @save_state = SaveState.create(
      user_id: session[:user_id], 
      score: userScore,
      difficulty: userDiff,
      bullets: userBullets,
      lives: userLives
      )
    if @save_state.save
      respond_to do |format|
         format.html {redirect_to root_path}
      end 
    end
  end
    
end
