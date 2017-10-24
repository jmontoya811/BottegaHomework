class ProfilesController < ApplicationController

  def index
  @profile_items = Profile.all
  end

  def new
    @profile_item = Profile.new
  end

  def create
    @profile_item = Profile.new(params.require(:profile).permit(:title, :subtitle, :body))

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
      if @profile_item.update(params.require(:profile).permit(:title, :subtitle, :body))
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

end

