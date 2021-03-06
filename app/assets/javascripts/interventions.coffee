# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    none = '<option value="">None</option>';
    nothing = '<option value=""></option>';


    #BUILDINGS
    $('#intervention_building_id').parent().hide()
    buildings = $('#intervention_building_id').html()
    #console.log(buildings)
    $('#intervention_customer_id').change ->
        customer = $('#intervention_customer_id :selected').text()
        building_options = $(buildings).filter("optgroup[label='#{customer}']").html()
        #console.log(building_options)
        if building_options
            $('#intervention_building_id').html(nothing + building_options)
            $('#intervention_building_id').parent().show()
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').parent().hide()
        else
            $('#intervention_building_id').empty()
            $('#intervention_building_id').parent().hide()
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').parent().hide()

    #BATERRIES
    $('#intervention_battery_id').parent().hide()
    batteries = $('#intervention_battery_id').html()
    #console.log(batteries)
    $('#intervention_building_id').change ->
        building = $('#intervention_building_id :selected').text()
        batteries_options = $(batteries).filter("optgroup[label='#{building}']").html()
        #console.log(building_options)
        if batteries_options
            $('#intervention_battery_id').html(none + batteries_options)
            $('#intervention_battery_id').parent().show()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').parent().hide()
        else 
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').parent().hide()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').parent().hide()

    #COLUMNS
    $('#intervention_column_id').parent().hide()
    columns = $('#intervention_column_id').html()
    #console.log(columns)
    $('#intervention_battery_id').change ->
        #console.log(columns)
        battery = $('#intervention_battery_id :selected').text()
        columns_options = $(columns).filter("optgroup[label='#{battery}']").html()

        if columns_options
            $('#intervention_column_id').html(none + columns_options)
            $('#intervention_column_id').parent().show()
            $('#intervention_elevator_id').parent().hide()
        else 
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()
            $('#intervention_elevator_id').parent().hide()

    #ELEVATORS
    $('#intervention_elevator_id').parent().hide()
    elevators = $('#intervention_elevator_id').html()
    $('#intervention_column_id').change ->
        #console.log(elevators)
        column = $('#intervention_column_id :selected').text()
        elevators_options = $(elevators).filter("optgroup[label='#{column}']").html()

        if elevators_options
            $('#intervention_elevator_id').html(none + elevators_options)
            $('#intervention_elevator_id').parent().show()    
        else 
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()
