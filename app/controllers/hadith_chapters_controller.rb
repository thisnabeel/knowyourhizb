class HadithChaptersController < ApplicationController
  before_action :set_hadith_chapter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /hadith_chapters
  # GET /hadith_chapters.json
  def index
    @hadith_chapters = HadithChapter.all
  end

  # GET /hadith_chapters/1
  # GET /hadith_chapters/1.json
  def show
  end

  # GET /hadith_chapters/new
  def new
    @hadith_chapter = HadithChapter.new
  end

  # GET /hadith_chapters/1/edit
  def edit
  end

  # POST /hadith_chapters
  # POST /hadith_chapters.json
  def create
    @hadith_chapter = HadithChapter.new(hadith_chapter_params)

    respond_to do |format|
      if @hadith_chapter.save
        format.html { redirect_to @hadith_chapter, notice: 'Hadith chapter was successfully created.' }
        format.json { render :show, status: :created, location: @hadith_chapter }
      else
        format.html { render :new }
        format.json { render json: @hadith_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hadith_chapters/1
  # PATCH/PUT /hadith_chapters/1.json
  def update
    respond_to do |format|
      if @hadith_chapter.update(hadith_chapter_params)
        format.html { redirect_to @hadith_chapter, notice: 'Hadith chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @hadith_chapter }
      else
        format.html { render :edit }
        format.json { render json: @hadith_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hadith_chapters/1
  # DELETE /hadith_chapters/1.json
  def destroy
    @hadith_chapter.destroy
    respond_to do |format|
      format.html { redirect_to hadith_chapters_url, notice: 'Hadith chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hadith_chapter
      @hadith_chapter = HadithChapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hadith_chapter_params
      params.require(:hadith_chapter).permit!
    end
end
