class CultsController < ApplicationController
  before_action :set_cult, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  # GET /cults
  # GET /cults.json
  def index
    @cults = Cult.all.order("release_date ASC")
  end

  def all_cached
    @cults = Cult.all_cached
    render json: @cults
  end

  def cached
    @chapters = Cult.all.order("release_date ASC")
    render json: @chapters
  end

  def recache
    Cult.recache
    render status: 200, json: {
      message: "Successful!",
    }.to_json
  end

  def config_cults
  end
  # GET /cults/1
  # GET /cults/1.json
  def show
  end

  # GET /cults/new
  def new
    @cult = Cult.new
  end

  # GET /cults/1/edit
  def edit
  end

  # POST /cults
  # POST /cults.json
  def create
    @cult = Cult.new(cult_params)

    respond_to do |format|
      if @cult.save
        format.html { redirect_to @cult, notice: 'Cult was successfully created.' }
        format.json { render :show, status: :created, location: @cult }
      else
        format.html { render :new }
        format.json { render json: @cult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cults/1
  # PATCH/PUT /cults/1.json
  def update
    respond_to do |format|
      if @cult.update(cult_params)
        format.html { redirect_to @cult, notice: 'Cult was successfully updated.' }
        format.json { render :show, status: :ok, location: @cult }
      else
        format.html { render :edit }
        format.json { render json: @cult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cults/1
  # DELETE /cults/1.json
  def destroy
    @cult.destroy
    respond_to do |format|
      format.html { redirect_to cults_url, notice: 'Cult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def config_cults
    # Get List Array
    list = params[:list]

    puts list

    # Each Chapter
    list.each do |t|
    # Find Chapter
    chapter = Cult.find(t["id"])
    # chapter.update(chapter_id: nil)
    chapter.update(
      position: t["position"],
      cult_id: t["belongs"],
    ) 
    end

    render status: 200, json: {
      message: "Successfully saved map!",
    }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cult
      @cult = Cult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cult_params
      params.require(:cult).permit!
    end
end
