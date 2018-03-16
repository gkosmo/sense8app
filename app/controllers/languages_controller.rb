class LanguagesController < ApplicationController
  def create
    set_profile
    @profile.languages << Language.find(profile_params[:language_to_profiles][:languages])
    respond_to do |format|

      if @profile.save
         @language = @profile.languages.last
        @new_language = Language.new
      end
      format.js
    end
  end

  def update
  end

  def destroy
    set_profile
    @language = Language.find(params[:id])
    LanguageToProfile.where(profile: @profile, language: @language).first.destroy
  end
  private
      # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:language).permit(language_to_profiles: [:languages] )
    end
end
