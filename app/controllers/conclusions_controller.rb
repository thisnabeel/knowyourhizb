class ConclusionsController < ApplicationController
  before_action :set_conclusion, only: [:show, :edit, :update, :destroy]

  # GET /conclusions
  # GET /conclusions.json
  def index
    @conclusions = Conclusion.all
  end

  # GET /conclusions/1
  # GET /conclusions/1.json
  def show
  end

  # GET /conclusions/new
  def new
    @conclusion = Conclusion.new
  end

  # GET /conclusions/1/edit
  def edit
  end

  # POST /conclusions
  # POST /conclusions.json
  def create
    @conclusion = Conclusion.new(conclusion_params)

    respond_to do |format|
      if @conclusion.save
        format.html { redirect_to @conclusion, notice: 'Conclusion was successfully created.' }
        format.json { render :show, status: :created, location: @conclusion }
      else
        format.html { render :new }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conclusions/1
  # PATCH/PUT /conclusions/1.json
  def update
    respond_to do |format|
      if @conclusion.update(conclusion_params)
        format.html { redirect_to @conclusion, notice: 'Conclusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @conclusion }
      else
        format.html { render :edit }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conclusions/1
  # DELETE /conclusions/1.json
  def destroy
    @conclusion.destroy
    respond_to do |format|
      format.html { redirect_to conclusions_url, notice: 'Conclusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conclusion
      @conclusion = Conclusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conclusion_params
      params.require(:conclusion).permit(:body, :position, :narration_id, :signal)
    end
end
