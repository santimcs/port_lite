class LatestDatesController < ApplicationController
  before_action :set_latest_date, only: [:show, :edit, :update, :destroy]

  # GET /latest_dates
  # GET /latest_dates.json
  def index
    @latest_dates = LatestDate.all
  end

  # GET /latest_dates/1
  # GET /latest_dates/1.json
  def show
  end

  # GET /latest_dates/new
  def new
    @latest_date = LatestDate.new
  end

  # GET /latest_dates/1/edit
  def edit
  end

  # POST /latest_dates
  # POST /latest_dates.json
  def create
    @latest_date = LatestDate.new(latest_date_params)

    respond_to do |format|
      if @latest_date.save
        format.html { redirect_to @latest_date, notice: 'Latest date was successfully created.' }
        format.json { render :show, status: :created, location: @latest_date }
      else
        format.html { render :new }
        format.json { render json: @latest_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /latest_dates/1
  # PATCH/PUT /latest_dates/1.json
  def update
    respond_to do |format|
      if @latest_date.update(latest_date_params)
        format.html { redirect_to @latest_date, notice: 'Latest date was successfully updated.' }
        format.json { render :show, status: :ok, location: @latest_date }
      else
        format.html { render :edit }
        format.json { render json: @latest_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /latest_dates/1
  # DELETE /latest_dates/1.json
  def destroy
    @latest_date.destroy
    respond_to do |format|
      format.html { redirect_to latest_dates_url, notice: 'Latest date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latest_date
      @latest_date = LatestDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latest_date_params
      params.require(:latest_date).permit(:date)
    end
end
