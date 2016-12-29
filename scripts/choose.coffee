# Description:
#   Choose from candidates.
random = require('hubot').Response::random

module.exports = (robot) ->
  robot.respond /(?:select|choose)\s*(\*|[1-9][0-9]{0,2})?\s*from\s*(.*)/i, (msg) ->
    candidates = msg.match[2].split(/[　・、,\s]+/)
    num = 1
    if msg.match[1]
      num = parseInt(msg.match[1], 10) || candidates.length
    if num > candidates.length
      num = candidates.length
    for i in [0..num-1]
      chosen = random candidates
      candidates = candidates.filter (member) -> member isnt chosen
      msg.send chosen
