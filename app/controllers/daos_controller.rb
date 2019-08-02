class DaosController < ApplicationController
  before_action :set_dao, only: [:show, :update, :destroy]

  # GET /daos
  def index
    @daos = Dao.all

    render json: @daos, include: [:framework, :blockchain]
  end

  # GET /daos/1
  def show
    render json: @dao, include: [:podcasts, :articles, :documents, { audits: { include: :auditor } }, :contracts, :tags, :contributors, :image, :blockchain, :framework, :status]
  end

  # POST /daos
  def create
    @dao = Dao.new(dao_params)

    if @dao.save
      render json: @dao, status: :created, location: @dao
    else
      render json: @dao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daos/1
  def update
    if @dao.update(dao_params)
      render json: @dao
    else
      render json: @dao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /daos/1
  def destroy
    @dao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dao
      @dao = Dao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dao_params
      params.require(:dao).permit(:name, :subtitle, :description, :website, :contract_proof, :mail, :github, :twitter, :medium, :telegram, :reddit, :discord)
    end
end
