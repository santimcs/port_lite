# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#profits').dataTable({
        pagingType: 'full_numbers', 
        order: [[ 1, "desc" ],[ 2, "desc" ],[ 6, "desc" ]]
        })