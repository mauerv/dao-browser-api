class AuditorsController < ApplicationController
  include Secured

  before_action :set_auditor, only: [:show, :update, :destroy]

  # GET /auditors
  def index
    @auditors = Auditor.all

    render json: @auditors
  end

  # GET /auditors/1
  def show
    render json: @auditor
  end

  # POST /auditors
  def create
    @auditor = Auditor.new(auditor_params)

    if @auditor.save
      render json: @auditor, status: :created, location: @auditor
    else
      render json: @auditor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auditors/1
  def update
    if @auditor.update(auditor_params)
      render json: @auditor
    else
      render json: @auditor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auditors/1
  def destroy
    @auditor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditor
      @auditor = Auditor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def auditor_params
      params.require(:auditor).permit(:name, :website)
    end
end
