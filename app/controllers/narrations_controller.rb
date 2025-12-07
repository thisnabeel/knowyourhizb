class NarrationsController < ApplicationController
  before_action :set_narration, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /narrations
  # GET /narrations.json
  def index
    @narrations = Narration.all
  end

  # GET /narrations/1
  # GET /narrations/1.json
  def show
    render json: @narration, serializer: NarrationsSerializer, serializer_options: { 
      show_full: true
    }

  end

  # GET /narrations/new
  def new
    @narration = Narration.new
  end

  # GET /narrations/1/edit
  def edit
  end

  def reset_narration
    n = Narration.find(params[:id])
    n.reset_narration
  end

  def bulker
    Narration.bulk_add_narrator(params[:name])
    head :ok, content_type: "text/html"
  end

  def remove_narrator
    id = params[:id].to_i
    name = params[:name]
    Narration.remove_narrator(id, name)
    head :ok, content_type: "text/html"
  end

  # POST /narrator_narrations/:id/link_narrator
  def link_narrator_narration
    narrator_narration = NarratorNarration.find(params[:id])
    narrator_id = params[:narrator_id].to_i
    
    if narrator_id > 0 && narrator_narration.update(narrator_id: narrator_id)
      render json: { success: true, narrator_narration: NarratorNarrationSerializer.new(narrator_narration) }
    else
      render json: { success: false, errors: narrator_narration.errors }, status: :unprocessable_entity
    end
  end

  # POST /narrations
  # POST /narrations.json
  def create
    @narration = Narration.new(narration_params)

    respond_to do |format|
      if @narration.save
        format.html { redirect_to @narration, notice: 'Narration was successfully created.' }
        format.json { render :show, status: :created, location: @narration }
      else
        format.html { render :new }
        format.json { render json: @narration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrations/1
  # PATCH/PUT /narrations/1.json
  def update

    if params[:narrators].present?
      @narration.narrator_narrations.destroy_all
      puts params[:narrators].count
      params[:narrators].each do |narrator|
        puts narrator[:context_name]
        NarratorNarration.create(
          uuid: narrator[:uuid],
          position: narrator[:position],
          context_name: narrator[:context_name],
          language: params[:language],
          narration_id: @narration.id
        )
      end
    end

    # puts params[:narrators]
    # return

    respond_to do |format|
      if @narration.update(narration_params)
        format.html { redirect_to @narration, notice: 'Narration was successfully updated.' }
        format.json { render json: @narration, serializer: NarrationsSerializer  }
      else
        format.html { render :edit }
        format.json { render json: @narration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrations/1
  # DELETE /narrations/1.json
  def destroy
    @narration.destroy
    respond_to do |format|
      format.html { redirect_to narrations_url, notice: 'Narration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fetch_musnad
    require 'nokogiri'
    require 'open-uri'
    require 'json'

    link = params[:url]
    @hadith_book = HadithBook.find(params[:id])
    @hadith_book.hadith_chapters.destroy_all
    @hadith_chapter = HadithChapter.create(hadith_book_id: @hadith_book.id, title: "Ahadith", position: 1)

    global_index = 0
    link.split("[split]").each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.css(".prose p").each_with_index do |hadith, index|
        global_index = global_index + 1
        Narration.create(arabic: hadith, hadith_chapter_id: @hadith_chapter.id, position: global_index)      
        puts hadith
      end
    end

    render json: @hadith_book

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narration
      @narration = Narration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def narration_params
      params.require(:narration).permit!
    end
end
