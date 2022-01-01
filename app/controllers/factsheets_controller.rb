class FactsheetsController < ApplicationController
  before_action :set_factsheet, only: [:show, :edit, :update, :destroy]

  # GET /factsheets
  # GET /factsheets.json
  def index
    @factsheets = Factsheet.where('item_id > 2').includes(:item)
  end

  # GET /factsheets/1
  # GET /factsheets/1.json
  def show
  end

  # GET /factsheets/new
  def new
    @factsheet = Factsheet.new
  end

  # GET /factsheets/1/edit
  def edit
  end

  # POST /factsheets
  # POST /factsheets.json
  def create
    @factsheet = Factsheet.new(factsheet_params)

    respond_to do |format|
      if @factsheet.save
        format.html { redirect_to @factsheet, notice: 'Factsheet was successfully created.' }
        format.json { render :show, status: :created, location: @factsheet }
      else
        format.html { render :new }
        format.json { render json: @factsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factsheets/1
  # PATCH/PUT /factsheets/1.json
  def update
    respond_to do |format|
      if @factsheet.update(factsheet_params)
        format.html { redirect_to @factsheet, notice: 'Factsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @factsheet }
      else
        format.html { render :edit }
        format.json { render json: @factsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factsheets/1
  # DELETE /factsheets/1.json
  def destroy
    @factsheet.destroy
    respond_to do |format|
      format.html { redirect_to factsheets_url, notice: 'Factsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factsheet
      @factsheet = Factsheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factsheet_params
      params.require(:factsheet).permit(:name, :item_id, :figure1, :figure2, :figure3, :figure4)
    end
end
