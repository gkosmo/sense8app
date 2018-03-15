class HobbiesController < ApplicationController
  def create
    @hobby = Hobby.new(hobbies_params)
    @profile = Profile.find(params[:profile_id])
    @profile.hobbies.build(hobbies_params)
    respond_to do |format|
      if @profile.save!
        @hobby = @profile.hobbies.last
        format.json { render :show, status: :created, location: @profile }
        format.js
        @new_hobby = Hobby.new
      else
        format.js

        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
   @hobby  = Hobby.find(params[:id])
   @hobby.destroy
   @profile = Profile.find(params[:profile_id])
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  private

   def hobbies_params
      params.require(:hobby).permit(:title, :proficiency, :description)
   end
end
