class ChartsController < ApplicationController
  def stocks_by_status
    result = Stock.group(:status).count
    render json: [{name: 'Count', data: result}]
  end
end