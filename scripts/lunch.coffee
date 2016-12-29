# Description:
#   Suggest lunch menus.
random = require('hubot').Response::random

lunch_list = ["和食", "中華料理", "香港料理", "タイ料理", "イタリアン", "メキシカン",
              "肉", "焼き肉", "魚", "寿司", "つけ麺", "ラーメン", "冷麺", "釜飯",
              "カツ", "牛カツ", "スープカレー", "カレー",  "インドカレー","パスタ",
              "居酒屋ランチ", "ホテルでランチ", "メロンソーダが飲める店",
              "新規開拓"]

suffix_list = ["にしてみては？", "にしとけって。",
              "とかどうですか？", "がいいと思う。",
              "でいいんじゃない？", "でお願いします。"]

module.exports = (robot) ->
  today_lunch = (lunch_list) ->
    yesterday = robot.brain.get 'yesterday_lunch'

    for unused in [1..1000]
      lunch = random(lunch_list)
      if lunch isnt yesterday
        robot.brain.set 'yesterday_lunch', lunch
        return lunch

  robot.respond /(.*)飯(.*)どこ/i, (msg) ->
    msg.send today_lunch(lunch_list) + random(suffix_list)
