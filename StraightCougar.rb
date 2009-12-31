#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "rubygems"
require "twitter"
require "twitterstream"

username = 'fastest_bot'
password = ARGV[0]

httpauth = Twitter::HTTPAuth.new(username, password)

begin
  TwitterStream::Client.new(username, password).track("@fastest_bot") do |status|
    next unless status['text']
    user = status['user']
    base = Twitter::Base.new(httpauth)
    base.update("@" + user['screen_name'] + " " +
                (case rand(6)
                 when 0
                   "あーやだやだ。文化を知らない奴らは"
                 when 1
                   "愚問ですなあ、隊長。オレはオレの味方です"
                 when 2
                   "オー、邪魔邪魔"
                 when 3
                   "つまらないですか？寒いですか？ひきましたか？痛かったですか？"
                 when 4
                 "愚問だなあ。オレは誰よりも速く走れる男だぜ"
                 when 5
                   "オレがオレの道を進むように、おまえにもおまえの道があるはずだ。さあ、おまえはどの道を選ぶ？"
                 end) + "　" * rand(30))
  end
rescue Timeout::Error
  puts "timeout"
  retry
rescue => e
  puts "error :" + e
  retry
end 
