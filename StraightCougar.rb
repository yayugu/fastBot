#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "rubygems"
require "twitter"
require "twitterstream"

tweets=["あーやだやだ。文化を知らない奴らは",
        "愚問ですなあ、隊長。オレはオレの味方です",
        "オー、ジャマジャマ",
        "つまらないですか？寒いですか？ひきましたか？痛かったですか？",
        "愚問だなあ。オレは誰よりも速く走れる男だぜ",
        "オレがオレの道を進むように、おまえにもおまえの道があるはずだ。さあ、おまえはどの道を選ぶ？",
        "そして私はストレイト・クーガー、なによりも速さを求める男です",
        "そうだ――！！ その弱い考え方に反逆するんだよ！",
        "いい反逆っぷりだ！しかし口先だけでこの俺は倒せない！！",
        "俺の速さの前には逃げることも隠れることもできない",
        "遅い！これが俺の速さだ！！！",
        "いや…何を言っても言い訳だ。本気に水を差すほど俺もバカじゃない、ならば！超特急でお前をあの世に送る！！",
        "昔の自分に恥ずかしくねェのかっ！？",
        "そしてなによりも────速さが足りない！！！"]
        
username = 'fastest_bot'
password = ARGV[0]
httpauth = Twitter::HTTPAuth.new(username, password)
begin
  TwitterStream::Client.new(username, password).track("@fastest_bot") do |status|
    next unless status['text']
    user = status['user']
    base = Twitter::Base.new(httpauth)
    base.update("@" + user['screen_name'] + " " + tweets[rand(tweets.size)] + "　" * rand(30))
  end
rescue Timeout::Error
  puts "timeout"
  retry
rescue => e
  puts "error :" + e
  retry
end 
