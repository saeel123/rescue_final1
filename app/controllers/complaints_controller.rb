class ComplaintsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :find,:edit,:index]
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  # GET /complaints
  # GET /complaints.json
  def index
   @complaints = Complaint.where(:user_id => current_user.id)
  @location = Location.new
 @location.user_id = current_user.id


 @complaints_filter= Complaint.where("user_id != ?",current_user.id).where("status != ?",true)

  @complaints_attending= Complaint.where(:rescuer_id => current_user.id)
  end

  def notified_complaints
  @complaints = Complaint.where(:user_id => current_user.id)
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
     @rescue_complaint = Rescuecompt.new
  @rescue_complaint.user_id = current_user.id
          #@user = Carpool.find(params[:format]).user
    @complaint_id=Complaint.find(params[:id]).id
    @latitude = Complaint.find(params[:id]).latitude
    @longitude = Complaint.find(params[:id]).longitude
    @city_name = Complaint.find(params[:id]).city_name
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
     @complaint = Complaint.new(complaint_params)
    #@complaint= @complaint.update(complaint_params)

    
    @complaint.user_id = current_user.id
    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        flash[:alert]= "Your location has been updated"
    
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def attend
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:species, :status, :city_name, :species_image, :latitude, :longitude,:user_id)
    end
end
