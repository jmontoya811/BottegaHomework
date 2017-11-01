class ProfilesController < ApplicationController

  def index
  @profile_items = Profile.by_position
  end

 def sort 
    params[:order].each do |key, value|
      Profile.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end 

  def new
    @profile_item = Profile.new
  end

  def create
    @profile_item = Profile.new(profile_params)

    respond_to do |f|
      if @profile_item.save
        f.html { redirect_to profiles_path, notice: 'Profile created successfully.' }
        f.json { render :show, status: :created, location: @profile_item }
      else
        f.html { render :new }
        f.json { render json: @profile_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @profile_item = Profile.find(params[:id])
  end

  def update
    @profile_item = Profile.find(params[:id])
    respond_to do |format|
      if @profile_item.update(profile_params)
        format.html { redirect_to profiles_path, notice: 'Profile has been successfully updated.' }
      else
        format.html { render :edit }
      end
    end 
  end 

  def show 
    @profile_item = Profile.find(params[:id])
  end 

  def destroy
    @profile_item = Profile.find(params[:id])

    @profile_item.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile Destroyed.' }
      format.json { head :no_content }
    end
  end 

  private

  def profile_params
    params.require(:profile).permit(:title, :subtitle, :body)
  end
end

