$(document).ready ->

  $('body').on 'click', '#currency_converter', ->
    from = $('#from_currency').val()
    to = $('#to_currency').val()
    fromNumber = $('#from_number').val()
    if from and to and fromNumber
      $.ajax({url: '/dashboard/show', dataType: "json", type: 'get', data: { currency: {from: from, to: to, from_value: fromNumber}}}).done (response) ->
        $('#to_number').val(response.result)
