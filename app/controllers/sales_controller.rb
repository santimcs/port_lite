class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all.includes(:latest_date)

  end

  def list_top10_days
    @sales = Sale.find_each
  end

  def list_today
    @q = Sale.ransack(params[:q])
    @sales = @q.result

  end

  def list_buy_alert
    @sales = Sale.buy_alert.includes(:latest_date)
  end

  def list_sell_alert
    @sales = Sale.sell_alert.includes(:latest_date)
  end  

  def list_short_sell
    @sales = Sale.short_sell.includes(:latest_date)
  end 

  def list_cover_buy
    @sales = Sale.cover_buy.includes(:latest_date)
  end 

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def export
  attributes_to_include = %w(name fm_date to_date)
  @data = Sale.where(to_date: '2016-06-03')
  respond_to do |format|
    format.html { redirect_to root_url }
    format.csv { send_data @data.to_csv }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:name, :fm_date, :to_date, :days, :fm_price, :to_price,
       :diff, :pct, :ttl_spread, :avg_spread, :qty, :max_price, :min_price)
    end
end
