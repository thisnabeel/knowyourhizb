class HadithCollectionsController < ApplicationController
  before_action :set_hadith_collection, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!

  # GET /hadith_collections
  # GET /hadith_collections.json
  def index
    @hadith_collections = HadithCollection.all
    render json: @hadith_collections
  end

  # GET /hadith_collections/1
  # GET /hadith_collections/1.json
  def show
    render json: @hadith_collection.attributes.merge({
      hadith_books: @hadith_collection.hadith_books.order("position ASC")
    })
  end

  # GET /hadith_collections/new
  def new
    @hadith_collection = HadithCollection.new
  end

  # GET /hadith_collections/1/edit
  def edit
  end

  # POST /hadith_collections
  # POST /hadith_collections.json
  def create
    @hadith_collection = HadithCollection.new(hadith_collection_params)

    respond_to do |format|
      if @hadith_collection.save
        format.html { redirect_to @hadith_collection, notice: 'Hadith collection was successfully created.' }
        format.json { render :show, status: :created, location: @hadith_collection }
      else
        format.html { render :new }
        format.json { render json: @hadith_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hadith_collections/1
  # PATCH/PUT /hadith_collections/1.json
  def update
    respond_to do |format|
      if @hadith_collection.update(hadith_collection_params)
        format.html { redirect_to @hadith_collection, notice: 'Hadith collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @hadith_collection }
      else
        format.html { render :edit }
        format.json { render json: @hadith_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hadith_collections/1
  # DELETE /hadith_collections/1.json
  def destroy
    @hadith_collection.destroy
    respond_to do |format|
      format.html { redirect_to hadith_collections_url, notice: 'Hadith collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hadith_collection
      @hadith_collection = HadithCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hadith_collection_params
      params.require(:hadith_collection).permit!
    end
end
