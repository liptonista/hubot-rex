# Description:
#   Show weather radar image.
get2digits = (n) ->
  return ('0' + n).slice(-2)

getRadarURL = () ->
  d = new Date
  d.setMinutes(d.getMinutes() - 1)
  year  = d.getFullYear()
  month = get2digits(d.getMonth() + 1)
  date  = get2digits(d.getDate())
  hour  = get2digits(d.getHours())
  min   = get2digits(Math.floor(d.getMinutes()/5) * 5)
  url = "http://www.jma.go.jp/jp/radnowc/imgs/radar/206/"
  url += "#{year}#{month}#{date}#{hour}#{min}-00.png"
  return url

module.exports = (robot) ->
  robot.respond /radar/i, (msg) ->
    url = getRadarURL()
    msg.send url
