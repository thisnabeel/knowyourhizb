class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[ show update destroy ]

  # GET /chapters
  def index
    @chapters = Chapter.all.order("position ASC")

    render json: @chapters
  end

  # GET /chapters/1
  def show
    @chapter = Chapter.includes(:pieces).find_by(slug: params[:id]) || Chapter.find(params[:id])
    render json: @chapter.as_json(include: :pieces)
  end

  # POST /chapters
  def create
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      render json: @chapter, status: :created, location: @chapter
    else
      render json: @chapter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chapters/1
  def update
    if @chapter.update(chapter_params)
      render json: @chapter
    else
      render json: @chapter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chapters/1
  def destroy
    @chapter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find_by(slug: params[:id]) || Chapter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chapter_params
      params.require(:chapter).permit(:title, :image, :description, :difficulty, :position, :chapter_id, :visibility, :code, :slug, :is_course, :body)
    end
end
