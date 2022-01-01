# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#consensus').dataTable({
        pagingType: 'full_numbers', 
        order: [[ 13, "asc" ],[ 3, "desc" ]]
        })