class NarratorsController < ApplicationController
  before_action :set_narrator, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /narrators
  # GET /narrators.json
  def index
    @narrators = Narrator.all
  end

  # GET /narrators/1
  # GET /narrators/1.json
  def show
  end

  # GET /narrators/new
  def new
    @narrator = Narrator.new
  end

  # GET /narrators/1/edit
  def edit
  end

  def view
    require 'csv'    

    csv_text = File.read('lib/all_rawis.csv')
    csv = CSV.parse(csv_text, :headers => true)
    @n_list = []
    csv.each do |row|
      # Moulding.create!(row.to_hash)
      @n_list.push(row.to_hash)
    end
  end

  # POST /narrators
  # POST /narrators.json
  def create
    @narrator = Narrator.new(narrator_params)

    respond_to do |format|
      if @narrator.save
        format.html { redirect_to @narrator, notice: 'Narrator was successfully created.' }
        format.json { render :show, status: :created, location: @narrator }
      else
        format.html { render :new }
        format.json { render json: @narrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrators/1
  # PATCH/PUT /narrators/1.json
  def update
    respond_to do |format|
      if @narrator.update(narrator_params)
        format.html { redirect_to @narrator, notice: 'Narrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @narrator }
      else
        format.html { render :edit }
        format.json { render json: @narrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrators/1
  # DELETE /narrators/1.json
  def destroy
    @narrator.destroy
    respond_to do |format|
      format.html { redirect_to narrators_url, notice: 'Narrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narrator
      @narrator = Narrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def narrator_params
      params.fetch(:narrator).permit!
    end
end
