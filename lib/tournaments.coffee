Schema.Game = new SimpleSchema
  date:
    type: Date
    optional: true

  course:
    type: String
    optional: true

  difficulty:
    type: Number
    optional: true

  players:
    type: [Object] #_userId, [scores]
    optional: true
    blackbox: true


Schema.Tournament = new SimpleSchema
  title:
    type: String
    max: 120
    optional: true

  games:
    type: [Schema.Game]
    optional: true

Tournaments.attachSchema Schema.Tournament