class FrameworksController < ApplicationController
  before_action :set_framework, only: [:show, :update, :destroy]

  # GET /frameworks
  def index
    @frameworks = Framework.all

    render json: @frameworks
  end

  # GET /frameworks/1
  def show
    render json: @framework
  end

  # POST /frameworks
  def create
    @framework = Framework.new(framework_params)

    if @framework.save
      render json: @framework, status: :created, location: @framework
    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frameworks/1
  def update
    if @framework.update(framework_params)
      render json: @framework
    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frameworks/1
  def destroy
    @framework.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_framework
      @framework = Framework.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def framework_params
      params.require(:framework).permit(:name)
    end
end
