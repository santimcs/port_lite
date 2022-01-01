module StatisticsHelper
  
  def stocks_by_status
    bar_chart stocks_by_status_charts_path, height: '500px', library: {
      title: {text: 'Stocks by Type', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Number of Stocks'
         }
      },
      xAxis: {
         title: {
             text: 'I = In Port O = On Watch S = Short Sell'
         }
      }
    }
  end

end