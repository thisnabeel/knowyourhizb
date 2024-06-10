class LineTranslationsController < ApplicationController
  before_action :set_line_translation, only: [:show, :edit, :update, :destroy]

  # GET /line_translations
  # GET /line_translations.json
  def index
    @line_translations = LineTranslation.all
  end

  # GET /line_translations/1
  # GET /line_translations/1.json
  def show
  end

  # GET /line_translations/new
  def new
    @line_translation = LineTranslation.new
  end

  # GET /line_translations/1/edit
  def edit
  end

  # POST /line_translations
  # POST /line_translations.json
  def create
    @line_translation = LineTranslation.new(line_translation_params)

    respond_to do |format|
      if @line_translation.save
        format.html { redirect_to @line_translation, notice: 'Line translation was successfully created.' }
        format.json { render :show, status: :created, location: @line_translation }
      else
        format.html { render :new }
        format.json { render json: @line_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_translations/1
  # PATCH/PUT /line_translations/1.json
  def update
    respond_to do |format|
      if @line_translation.update(line_translation_params)
        format.html { redirect_to @line_translation, notice: 'Line translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_translation }
      else
        format.html { render :edit }
        format.json { render json: @line_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_translations/1
  # DELETE /line_translations/1.json
  def destroy
    @line_translation.destroy
    respond_to do |format|
      format.html { redirect_to line_translations_url, notice: 'Line translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_translation
      @line_translation = LineTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_translation_params
      params.require(:line_translation).permit(:line_id, :language, :content, :content_explanation, :grammar_explanation)
    end
end
