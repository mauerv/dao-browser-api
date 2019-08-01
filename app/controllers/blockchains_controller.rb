class BlockchainsController < ApplicationController
  before_action :set_blockchain, only: [:show, :update, :destroy]

  # GET /blockchains
  def index
    @blockchains = Blockchain.all

    render json: @blockchains
  end

  # GET /blockchains/1
  def show
    render json: @blockchain
  end

  # POST /blockchains
  def create
    @blockchain = Blockchain.new(blockchain_params)

    if @blockchain.save
      render json: @blockchain, status: :created, location: @blockchain
    else
      render json: @blockchain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blockchains/1
  def update
    if @blockchain.update(blockchain_params)
      render json: @blockchain
    else
      render json: @blockchain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blockchains/1
  def destroy
    @blockchain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blockchain
      @blockchain = Blockchain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blockchain_params
      params.require(:blockchain).permit(:name)
    end
end
