#############################################################################
# Animations

# counter starts at 0
Session.setDefault 'counter', 0
Session.setDefault 'showBillCard', 'off'

Template.hello.helpers
  counter: ->
    Session.get('counter')

Template.hello.events
  'click .btn': ->
    # increment the counter when button is clicked
    Session.set 'counter', Session.get('counter') + 1
    Session.set 'showBillCard', if Session.get 'showBillCard' then '' else 'off'
    console.log Session.get 'showBillCard'
    $ '#bill-button span.card-bullet'
      .addClass "animated"
      .one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', (e) ->
        $('#bill-button span.card-bullet').removeClass('animated')
