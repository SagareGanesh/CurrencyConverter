$(document).ready ->

  $('body').on 'click', '#currency_converter', ->
    from = $('#from_currency').val()
    to = $('#to_currency').val()
    fromNumber = $('#from_number').val()
    if from and to and fromNumber
      $.ajax({url: '/dashboard/show', type: 'post', data: { currency: {from: from, to: to, from_number: fromNumber}}}).done (res) ->
        console.log(res)
