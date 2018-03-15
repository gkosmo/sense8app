class EducationsController < ApplicationController
 def create
    @education = Education.new(educations_params)
    @profile = Profile.find(params[:profile_id])
    @profile.educations.build(educations_params)
    respond_to do |format|
      if @profile.save
        @education = @profile.educations.last
        @new_education = Education.new
        format.js
        format.html { redirect_to @profile, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render @profile }
        format.json { render json: @education.profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
   @education  = Education.find(params[:id])
   @education.destroy
   @profile = Profile.find(params[:profile_id])
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  private

   def educations_params
      params.require(:education).permit(:title, :proficiency, :description)
   end
end
