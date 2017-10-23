class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]  
  
  def index
        @profile_items = Profile.all
    end

    def new
        @profile_item = Profile.new
    end

    def edit
      @profile_item = Profile.find(params[:id])
    end

    def update
      @profile_item = Profile.find(params[:id])
      respond_to do |format|
        if @profile_item.update(profile_params)
          format.html { redirect_to profiles_path, notice: 'Profile successfully updated.' }
          format.json { render :show, status: :ok, location: @profile_item }
          else
            format.html { render :edit }
            format.json { render json: @profile_item.errors, status: :unprocessable_entity }
          end
      end
    end

    def create
        @profile_item = Profile.new(portfolio_params)
  
        respond_to do |format|
          if @profile_item.save
            format.html { redirect_to new_profile_path, notice: 'Your profile is now live.' }
          else
            format.html { render :new }
          end
        end
    end

    def show
    end

    def profile_params
      params.require(:profile).permit(:title, 
                                        :subtitle,
                                        :body
                                        )
    end
end
