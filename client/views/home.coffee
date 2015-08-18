Template.home.helpers
  game: ->
    name: "Game 1"

Template.leaderboard.helpers
  log: ->
    console.log "leaderboard template helper logging 'this'"
    console.dir this
  players: ->
    [
      name: "Alvin Anderson"
      handicap: 3
      scores: [3,4,2,1,4,9]
    ,
      name: "Bob Barker"
      handicap: 1
      scores: [4,4,4,2,1,4]
  ]

