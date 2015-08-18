Meteor.startup ->
  if Tournaments.find().count() is 0
    tournament =
      title: "fixture tourny"
      games: [
        date:  new Date()
        course: "fixtured coursaming"
        difficulty: 4
        players: [
            userid: "1"
            scores: [1,1,1,3,3,4,5]
          ,
            userid: "2"
            scores: [2,2,2,1,0,1,2]
          ,
            userid: "3"
            scores: [3,3,3,3,3,3,3]
        ]
      ]
    console.log "populating Tournaments collection with dummy data:"
    console.dir tournament  
    Tournaments.insert tournament
