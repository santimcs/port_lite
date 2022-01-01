class ConsensusController < ApplicationController
  before_action :set_consensu, only: [:show, :edit, :update, :destroy]

  # GET /consensus
  # GET /consensus.json
  def index
    @consensus = Consensu.all
  end

  # GET /consensus/1
  # GET /consensus/1.json
  def show
  end

  # GET /consensus/new
  def new
    @consensu = Consensu.new
  end

  # GET /consensus/1/edit
  def edit
  end

  # POST /consensus
  # POST /consensus.json
  def create
    @consensu = Consensu.new(consensu_params)

    respond_to do |format|
      if @consensu.save
        format.html { redirect_to @consensu, notice: 'Consensu was successfully created.' }
        format.json { render :show, status: :created, location: @consensu }
      else
        format.html { render :new }
        format.json { render json: @consensu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consensus/1
  # PATCH/PUT /consensus/1.json
  def update
    respond_to do |format|
      if @consensu.update(consensu_params)
        format.html { redirect_to @consensu, notice: 'Consensu was successfully updated.' }
        format.json { render :show, status: :ok, location: @consensu }
      else
        format.html { render :edit }
        format.json { render json: @consensu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consensus/1
  # DELETE /consensus/1.json
  def destroy
    @consensu.destroy
    respond_to do |format|
      format.html { redirect_to consensus_url, notice: 'Consensu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consensu
      @consensu = Consensu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consensu_params
      params.require(:consensu).permit(:name, :price, :buy, :hold, :sell, :eps_a, :eps_b, :pe, :pbv, :yield, :target_price, :status)
    end
end
