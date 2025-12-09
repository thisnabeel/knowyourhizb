class FiqhToolsController < ApplicationController
  before_action :set_fiqh_tool, only: [:show, :update, :destroy]

  # GET /fiqh_tools
  def index
    @fiqh_tools = FiqhTool.roots.includes(:children).ordered
    render json: @fiqh_tools, each_serializer: FiqhToolSerializer
  end

  # GET /fiqh_tools/:id
  def show
    render json: @fiqh_tool, serializer: FiqhToolSerializer
  end

  # POST /fiqh_tools
  def create
    @fiqh_tool = FiqhTool.new(fiqh_tool_params)

    if @fiqh_tool.save
      render json: @fiqh_tool, serializer: FiqhToolSerializer, status: :created
    else
      render json: @fiqh_tool.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fiqh_tools/:id
  def update
    if @fiqh_tool.update(fiqh_tool_params)
      render json: @fiqh_tool, serializer: FiqhToolSerializer
    else
      render json: @fiqh_tool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fiqh_tools/:id
  def destroy
    @fiqh_tool.destroy
    head :no_content
  end

  private
    def set_fiqh_tool
      @fiqh_tool = FiqhTool.find(params[:id])
    end

    def fiqh_tool_params
      params.require(:fiqh_tool).permit(:title, :description, :position, :fiqh_tool_id)
    end
end

