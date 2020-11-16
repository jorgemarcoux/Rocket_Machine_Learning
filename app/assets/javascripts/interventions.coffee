# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    buildings = $('#intervention_building_id').html()
    #console.log(buildings)
    $('#intervention_customer_id').click ->
        customer = $('#intervention_customer_id :selected').text()
        building_options = $(buildings).filter("optgroup[label='#{customer}']").html()
        #console.log(building_options)
        if building_options
            $('#intervention_building_id').html(building_options)

    batteries = $('#intervention_battery_id').html()
    #console.log(batteries)
    $('#intervention_building_id').click ->
        building = $('#intervention_building_id :selected').text()
        batteries_options = $(batteries).filter("optgroup[label='#{building}']").html()
        #console.log(building_options)
        if batteries_options
            $('#intervention_battery_id').html(batteries_options)
    
    columns = $('#intervention_column_id').html()
    #console.log(columns)
    $('#intervention_battery_id').click ->
        #console.log(columns)
        battery = $('#intervention_battery_id :selected').text()
        columns_options = $(columns).filter("optgroup[label='#{battery}']").html()

        if columns_options
            $('#intervention_column_id').html(columns_options)

    elevators = $('#intervention_elevator_id').html()
    $('#intervention_column_id').click ->
        #console.log(elevators)
        column = $('#intervention_column_id :selected').text()
        elevators_options = $(elevators).filter("optgroup[label='#{column}']").html()

        if elevators_options
            $('#intervention_elevator_id').html(elevators_options)    
    
