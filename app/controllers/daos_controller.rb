class DaosController < ApplicationController
  before_action :set_dao, only: [:show, :update, :destroy, :remove_tag_from_dao, :add_tag_to_dao, :remove_contributor_from_dao, :add_contributor_to_dao]

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

  # DELETE /daos/1/tags
  def remove_tag_from_dao
     tag = @dao.tags.find(params[:dao][:tag_id])
     if tag
        @dao.tags.delete(tag)
     end
     render json: @dao
  end

  # PUT /daos/1/tags
  def add_tag_to_dao
    tag = Tag.find(params[:dao][:tag_id])
    @dao.tags << tag
    render json: @dao
  end

  # DELETE /daos/1/contributors
  def remove_contributor_from_dao
     contributor = @dao.contributors.find(params[:dao][:contributor_id])
     if contributor
        @dao.contributors.delete(contributor)
     end
     render json: @dao
  end

  # PUT /daos/1/contributors
  def add_contributor_to_dao
    contributor = Contributor.find(params[:dao][:contributor_id])
    @dao.contributors << contributor
    render json: @dao
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dao
      @dao = Dao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dao_params
      params.require(:dao).permit(:name, :subtitle, :description, :website, :contract_proof, :mail, :github, :twitter, :medium, :telegram, :reddit, :discord, :youtube, :assets_governed, :decentralization_level, :centralization_points, :blockchain_id, :framework_id, :status_id, :image, :tag_id, :contributor_id, documents_attributes: [:id, :title, :url, :_destroy])
    end
end
