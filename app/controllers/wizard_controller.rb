class WizardController < ApplicationController
  def ask
    prompt = params[:prompt]
    response_format = params[:response_format] || "json_object"

    if prompt.blank?
      render json: { error: "Prompt is required" }, status: :unprocessable_entity
      return
    end

    begin
      result = WizardService.ask(prompt, response_format)
      render json: result
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
