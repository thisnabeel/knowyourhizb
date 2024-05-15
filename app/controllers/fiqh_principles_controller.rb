class FiqhPrinciplesController < ApplicationController
  before_action :set_fiqh_principle, only: [:show, :edit, :update, :destroy]

  # GET /fiqh_principles
  # GET /fiqh_principles.json
  def index
    @fiqh_principles = FiqhPrinciple.all
  end

  def search
    render json: FiqhPrinciple.where("title ILIKE ?", "%#{params[:query]}%")
  end

  # GET /fiqh_principles/1
  # GET /fiqh_principles/1.json
  def show
  end

  # GET /fiqh_principles/new
  def new
    @fiqh_principle = FiqhPrinciple.new
  end

  # GET /fiqh_principles/1/edit
  def edit
  end

  # POST /fiqh_principles
  # POST /fiqh_principles.json
  def create
    @fiqh_principle = FiqhPrinciple.new(fiqh_principle_params)

    respond_to do |format|
      if @fiqh_principle.save
        format.html { redirect_to @fiqh_principle, notice: 'Fiqh principle was successfully created.' }
        format.json { render :show, status: :created, location: @fiqh_principle }
      else
        format.html { render :new }
        format.json { render json: @fiqh_principle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiqh_principles/1
  # PATCH/PUT /fiqh_principles/1.json
  def update
    respond_to do |format|
      if @fiqh_principle.update(fiqh_principle_params)
        format.html { redirect_to @fiqh_principle, notice: 'Fiqh principle was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiqh_principle }
      else
        format.html { render :edit }
        format.json { render json: @fiqh_principle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiqh_principles/1
  # DELETE /fiqh_principles/1.json
  def destroy
    @fiqh_principle.destroy
    respond_to do |format|
      format.html { redirect_to fiqh_principles_url, notice: 'Fiqh principle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiqh_principle
      @fiqh_principle = FiqhPrinciple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiqh_principle_params
      params.require(:fiqh_principle).permit!
    end
end
