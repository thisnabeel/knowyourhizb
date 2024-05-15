class FiqhCasePrinciplesController < ApplicationController
  before_action :set_fiqh_case_principle, only: [:show, :edit, :update, :destroy]

  # GET /fiqh_case_principles
  # GET /fiqh_case_principles.json
  def index
    @fiqh_case_principles = FiqhCasePrinciple.all
  end

  # GET /fiqh_case_principles/1
  # GET /fiqh_case_principles/1.json
  def show
  end

  # GET /fiqh_case_principles/new
  def new
    @fiqh_case_principle = FiqhCasePrinciple.new
  end

  # GET /fiqh_case_principles/1/edit
  def edit
  end

  # POST /fiqh_case_principles
  # POST /fiqh_case_principles.json
  def create
    @fiqh_case_principle = FiqhCasePrinciple.new(fiqh_case_principle_params)

    respond_to do |format|
      if @fiqh_case_principle.save
        format.html { redirect_to @fiqh_case_principle, notice: 'Fiqh case principle was successfully created.' }
        format.json { render json: @fiqh_case_principle, serializer: FiqhCasePrincipleSerializer, status: :created, location: @fiqh_case_principle }
      else
        format.html { render :new }
        format.json { render json: @fiqh_case_principle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiqh_case_principles/1
  # PATCH/PUT /fiqh_case_principles/1.json
  def update
    respond_to do |format|
      if @fiqh_case_principle.update(fiqh_case_principle_params)
        format.html { redirect_to @fiqh_case_principle, notice: 'Fiqh case principle was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiqh_case_principle }
      else
        format.html { render :edit }
        format.json { render json: @fiqh_case_principle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiqh_case_principles/1
  # DELETE /fiqh_case_principles/1.json
  def destroy
    @fiqh_case_principle.destroy
    respond_to do |format|
      format.html { redirect_to fiqh_case_principles_url, notice: 'Fiqh case principle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiqh_case_principle
      @fiqh_case_principle = FiqhCasePrinciple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiqh_case_principle_params
      params.require(:fiqh_case_principle).permit(:passing, :fiqh_principle_id, :fiqh_case_id)
    end
end
