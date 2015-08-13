# initialize responsive background image
@createBackgroundSVG = ->
  # set dimensions of full size photos here (small.jpg is 2100x1400)
  photoWidth = 1610
  photoHeight = 1141
  # svg = d3.select('#bg-photo-container').insert('svg', ':first-child')
  svg = d3.select('body').insert('svg', ':first-child')
    .attr "id", "bg-photo-svg"
    .attr "viewBox", "0 0 #{photoWidth} #{photoHeight}"
    .attr "preserveAspectRatio", "xMidYMid slice"
      .append "svg:image"
      .attr "id", "bg-photo"
      .attr "xlink:href", '../img/RomanRoadCourse9th_crop.jpg'
      .attr "width", photoWidth
      .attr "height", photoHeight