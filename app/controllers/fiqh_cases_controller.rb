class FiqhCasesController < ApplicationController
  before_action :set_fiqh_case, only: [:show, :edit, :update, :destroy]

  # GET /fiqh_cases
  # GET /fiqh_cases.json
  def index
    render json: FiqhCase.all, each_serializer: FiqhCaseSerializer
  end

  # GET /fiqh_cases/1
  # GET /fiqh_cases/1.json
  def show
  end

  # GET /fiqh_cases/new
  def new
    @fiqh_case = FiqhCase.new
  end

  # GET /fiqh_cases/1/edit
  def edit
  end

  # POST /fiqh_cases
  # POST /fiqh_cases.json
  def create
    @fiqh_case = FiqhCase.new(fiqh_case_params)

    respond_to do |format|
      if @fiqh_case.save
        format.html { redirect_to @fiqh_case, notice: 'Fiqh case was successfully created.' }
        format.json { render json: @fiqh_case, serializer: FiqhCaseSerializer }
      else
        format.html { render :new }
        format.json { render json: @fiqh_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiqh_cases/1
  # PATCH/PUT /fiqh_cases/1.json
  def update
    respond_to do |format|
      if @fiqh_case.update(fiqh_case_params)
        format.html { redirect_to @fiqh_case, notice: 'Fiqh case was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiqh_case }
      else
        format.html { render :edit }
        format.json { render json: @fiqh_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiqh_cases/1
  # DELETE /fiqh_cases/1.json
  def destroy
    @fiqh_case.destroy
    respond_to do |format|
      format.html { redirect_to fiqh_cases_url, notice: 'Fiqh case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiqh_case
      @fiqh_case = FiqhCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiqh_case_params
      params.require(:fiqh_case).permit(:title, :position, :description, :fiqh_case_id)
    end
end
