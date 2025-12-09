class TidbitsController < ApplicationController
  before_action :set_narrator
  before_action :set_tidbit, only: [:show, :update, :destroy]

  # GET /narrators/:narrator_id/tidbits
  def index
    @tidbits = @narrator.tidbits.order(created_at: :desc)
    render json: @tidbits
  end

  # POST /narrators/:narrator_id/tidbits/generate
  def generate
    narrator_name = @narrator.name
    
    prompt = "Generate 3-5 cool, interesting, small rounded-pill style tidbits (short facts) about the narrator: #{narrator_name}. 

Each tidbit should be concise and interesting. IMPORTANT: Each title MUST include a relevant emoji at the beginning. Respond in JSON format with the following structure:
{
  \"tidbits\": [
    {
      \"title\": \"emoji + short catchy title (max 3-4 words)\",
      \"description\": \"brief interesting description (1-2 sentences)\"
    },
    ...
  ]
}

Make sure each title starts with an appropriate emoji that relates to the tidbit content."

    begin
      result = WizardService.ask(prompt, "json_object")
      
      if result && result["tidbits"]
        created_tidbits = []
        result["tidbits"].each do |tidbit_data|
          tidbit = @narrator.tidbits.create(
            title: tidbit_data["title"],
            description: tidbit_data["description"]
          )
          created_tidbits << tidbit if tidbit.persisted?
        end
        
        render json: { tidbits: created_tidbits }, status: :created
      else
        render json: { error: "Invalid response from wizard" }, status: :unprocessable_entity
      end
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  # POST /narrators/:narrator_id/tidbits
  def create
    @tidbit = @narrator.tidbits.new(tidbit_params)

    if @tidbit.save
      render json: @tidbit, status: :created
    else
      render json: @tidbit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /narrators/:narrator_id/tidbits/:id
  def update
    if @tidbit.update(tidbit_params)
      render json: @tidbit
    else
      render json: @tidbit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /narrators/:narrator_id/tidbits/:id
  def destroy
    @tidbit.destroy
    head :no_content
  end

  private
    def set_narrator
      @narrator = Narrator.find(params[:narrator_id])
    end

    def set_tidbit
      @tidbit = @narrator.tidbits.find(params[:id])
    end

    def tidbit_params
      params.require(:tidbit).permit(:title, :description)
    end
end

