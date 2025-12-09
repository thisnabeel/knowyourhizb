class NarratorNarrationsController < ApplicationController
  before_action :set_narrator_narration, only: [:link_narrator, :update_sources]

  # POST /narrator_narrations/:id/link_narrator.json
  def link_narrator
    @narrator_narration.update(narrator_id: params[:narrator_id])
    
    render json: {
      success: true,
      narrator_narration: @narrator_narration.as_json(
        include: [:narrator, source_narrator_narrations: { include: :narrator }]
      )
    }
  end

  # POST /narrator_narrations/:id/update_sources.json
  def update_sources
    # Clear existing sources
    @narrator_narration.narration_sources.destroy_all
    
    # Add new sources
    if params[:source_uuids].present?
      narration = @narrator_narration.narration
      source_narrations = narration.narrator_narrations.where(uuid: params[:source_uuids])
      
      source_narrations.each do |source_nn|
        NarrationSource.create(
          narrator_narration_id: @narrator_narration.id,
          source_narrator_narration_id: source_nn.id
        )
      end
    end
    
    render json: {
      success: true,
      narrator_narration: @narrator_narration.as_json(
        include: [:narrator, source_narrator_narrations: { include: :narrator }]
      )
    }
  end

  private

  def set_narrator_narration
    @narrator_narration = NarratorNarration.find(params[:id])
  end
end

