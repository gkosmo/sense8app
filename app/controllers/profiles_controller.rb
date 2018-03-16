class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
 before_action :check_cluster, except: [:new, :find_cluster]
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @new_hobby = Hobby.new
    @new_education = Education.new

    @new_language = Language.new

  end
  def find_cluster
    cluster=  Cluster.create_or_find_cluster(current_user)
    redirect_to cluster_path(cluster)
  end
  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.hobbies.build
  end

  def add_hobby
    @profile = Profile.new
    @profile.hobbies.build
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    current_user.profile = @profile
    current_user.save!
    respond_to do |format|
      if @profile.save

        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_cluster
     if  current_user.profile == @profile
     elsif !current_user.profile.cluster.nil? &&  current_user.profile.cluster == @profile.cluster
     else
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:birth_place, :birth_date, :nickname, :living_place, :gender, :gender_identity, :sexuality, language_to_profiles: [:languages] )
    end
end
