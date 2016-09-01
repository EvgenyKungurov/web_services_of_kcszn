class EmploymentCentersController < ApplicationController
  before_action :set_employment_center, only: [:show, :edit, :update, :destroy]

  # GET /employment_centers
  # GET /employment_centers.json
  def index
    @employment_centers = EmploymentCenter.all
  end

  # GET /employment_centers/1
  # GET /employment_centers/1.json
  def show
  end

  # GET /employment_centers/new
  def new
    @employment_center = EmploymentCenter.new
  end

  # GET /employment_centers/1/edit
  def edit
  end

  # POST /employment_centers
  # POST /employment_centers.json
  def create
    @employment_center = EmploymentCenter.new(employment_center_params)

    respond_to do |format|
      if @employment_center.save
        format.html { redirect_to @employment_center, notice: 'Employment center was successfully created.' }
        format.json { render :show, status: :created, location: @employment_center }
      else
        format.html { render :new }
        format.json { render json: @employment_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employment_centers/1
  # PATCH/PUT /employment_centers/1.json
  def update
    respond_to do |format|
      if @employment_center.update(employment_center_params)
        format.html { redirect_to @employment_center, notice: 'Employment center was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment_center }
      else
        format.html { render :edit }
        format.json { render json: @employment_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_centers/1
  # DELETE /employment_centers/1.json
  def destroy
    @employment_center.destroy
    respond_to do |format|
      format.html { redirect_to employment_centers_url, notice: 'Employment center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_center
      @employment_center = EmploymentCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_center_params
      params.fetch(:employment_center, {})
    end
end
