cd\devkit
devkitvars
cd\ruby

rails new my_port -d mysql
cd my_port
rake db:create

rails g controller pages home
modify routes.rb
root :to => 'pages#home'

# Problem

ExecJS::ProgramError in Pages#home
Showing C:/Ruby/my_port/app/views/layouts/application.html.erb where line #6 raised:
TypeError: Object doesn't support this property or method

# Solution

1. Delete turbolink from stylesheet_link_tag & javascript_link_tag
2. Modify application.js to disable turbolinks
3. Edit gemfile to disable turbolinks
4. Add gem 'coffee-script-source', '1.8.0' to gemfile (was '1.10.0')
5. bundle update

# Bootsrap

modify home.html.erb to check that bootstrap is included or not

<div class ="page-header text-center" > 
  <h1>Home</h1>
</div>

If bootsrap is not included then
Modify Gemfile
gem 'bootstrap-sass', '~> 3.3.5'

---

Be aware of this step
If modify to pages.coffee instead of pages.scss
Program will not inform that there is error but bootstrap
will not be in effect

---

Modify pages.scss
@import "bootstrap";

# Modify pages to carousel

1. Modify home.html.erb
2. copy bootstrap.min.js to assets/javascripts folder

# Add table Sales

rails g scaffold sale name fm_date:date to_date:date days:integer fm_price:decimal to_price:decimal diff:decimal pct:decimal ttl_spread:integer avg_spread:integer
max_price:decimal min_price:decimal qty:integer

edit sales migration to modify number of decimal
price precision: 6, scale: 2
diff,pct precision: 5, scale:2

rake db:migrate

# dataTable

edit gem file
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

Run the install generator:

rails g jquery:datatables:install bootstrap3

This will add to the corresponding asset files

# app/assets/javascripts/application.js

//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap

# app/assets/stylesheets/application.css

\*= require dataTables/bootstrap/3/jquery.dataTables.bootstrap

Initialize your datatables using these option:

$('#datatable').dataTable({
// ajax: ...,
// autoWidth: false,
// pagingType: 'full_numbers',
// processing: true,
// serverSide: true,

// Optional, if you want full pagination controls.
// Check dataTables documentation to learn more about available options.
// http://datatables.net/reference/option/pagingType
});

edit index.html

  <table id="sales" class="table table-striped table-hover">
  Modify column header for show, edit, destroy  
 ****** cannot use col span on header as query cannot assign sortable ****

edit sales.coffee
jQuery ->
$('#sales').dataTable({
pagingType: 'full_numbers',
order: [[0, "asc" ],[ 1, "desc"]]
})

# I18n

1. copy th.yml to config/locales ( from https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale)
2. modify config/locales/application.rb
   config.i18n.load_path += Dir[Rails.root.join('lib', 'locales', '*.{rb,yml}').to_s]
   config.i18n.default_locale = :th
3. number_to_currency(stock.buy_target, locale: :th)

# Integer Size

In mysql, data type integer is 4 bytes by default which limit its maximum number to 2,147,483,647
To expand the size must use migration to modify the size to 8 bytes
t.integer :some_field, :limit => 8
)

# Create crt_sales.rb in db

require 'csv'

class CrtSales < ActiveRecord::Base

CSV.foreach(Rails.root.join("db/sales.csv"), headers: false) do |row|

      Sale.find_or_create_by(name: row[0], fm_date: row[1], to_date: row[2],
      days: row[3], fm_price: row[4], to_price: row[5],
      diff: row[6], pct: row[7], ttl_spread: row[8], avg_spread: row[9],
      max_price: row[10], min_price: row[11], qty: row[12]

end

end

# Add table Stocks

rails g scaffold Stock name url buy_percent:decimal sell_percent:decimal

edit stocks migration to modify number of decimal
buy_percent, sell_percent precision: 4, scale: 2

rake db:migrate

edit index.html

  <table id="stocks" class="table table-striped table-hover">

edit stocks.coffee
jQuery ->
$('#stocks').dataTable({
pagingType: 'full_numbers',
order: [[0, "asc"]]
})

# Create menu

1. Modify application.html.erb

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="#" class="navbar-brand">Port_Lite</a>
        </div> <!--end navbar-header -->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><%= link_to 'Home', root_path %></li>
            <li><%= link_to 'Sales', sales_path %></li>
            <li><%= link_to 'Stocks', stock_path %></li>
          </ul>
        </div><!--end of collapse navbar-collapse -->

      </div> <!-- end of container -->
    </nav>  <!-- End of nav element -->
    <div class="container bodyContent"> <!-- from Bootstrap for Rails -->
      <%= yield %>
    </div> <!-- end of container -->

  </body>
  
2) Modify application.css to increase space between menu and content
  .bodyContent {
  margin-top: 50px;
  }

# Add table Factsheets

rails g model Factsheet name item:references figure1:decimal figure2:decimal figure3:decimal figure4:decimal

edit factsheets migration to modify number of decimal

rake db:migrate

rails g scaffold Factsheet name item:integer figure1:decimal figure2:decimal figure3:decimal figure4:decimal --skip-migration

edit index.html

  <table id="factsheets" class="table table-striped table-hover">

edit stocks.coffee
jQuery ->
$('#factsheets').dataTable({
pagingType: 'full_numbers',
order: [[0, "asc" ],[ 1, "asc"]]
})

bundle outdated
rails '4.2.5' -> '4.2.6'
ransack '1.5.1' -> '1.7.0'
web-console '2.3.0' -> '3.1.1'

# Add chart

Edit Gemfile
gem 'chartkick'
bundle install
copy highcharts.js to app/assets/javascripts

Edit javascripts/application.js
//= require highcharts
//= require chartkick

Create statistics_controller.rb
class StatisticsController < ApplicationController
def index
@stocks = Stock.all
end
end

Create views/statistics/index.html.erb

<h1>Statistics</h1>

<%#= bar_chart @stocks.group(:status).count %>

Create statistics_helper.rb
module StatisticsHelper

def stocks_by_status
bar_chart @stocks.group(:status).count, height: '500px', library: {
title: {text: 'Stocks by status', x: -20},
yAxis: {
allowDecimals: false,
title: {
text: 'Number of stocks'
}
},
xAxis: {
title: {
text: 'Status'
}
}
}
end

end

Modify views/statistics/index.html.erb

<h1>Statistics</h1>
<%= stocks_by_status %>

rails g scaffold latest_date date:date
rails db:migrate

rails g migration add_latest_date_id_to_sales latest_date_id:integer
rails db:migrate

Modify models/sale.rb
belongs_to :latest_date

    scope :buy_alert, -> {
        joins(:latest_date).
        where("to_date = date and pct <= 0")
    }

    scope :sell_alert, -> {
        joins(:latest_date).
        where("to_date = date and pct >= 0")
    }

    scope :short_sell, -> {
        joins(:latest_date).
        where("to_date = date and pct >= 0")
    }
    scope :cover_buy, -> {
        joins(:latest_date).
        where("to_date = date")
    }

rails g scaffold profit name quater latest_profit:integer previous_profit:integer inc_profit:integer inc_percent:decimal

# Add table Orders

rails g scaffold Order trade name qty:integer price:decimal amount:decimal active:boolean

edit Orders migration to modify number of decimal
price, amount precision: 4, scale: 2

rails db:migrate
