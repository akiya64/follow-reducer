require 'twitter'
require 'yaml'

yaml = YAML.load_file("config.yaml")

# TwitterAPI認証
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = yaml["my_consumer_key"]
  config.consumer_secret     = yaml["my_consumer_secret"]
  config.access_token        = yaml["my_access_token"]
  config.access_token_secret = yaml["my_access_token_secret"]
end

# APIでリストAutumnのメンバーを取得
list_members = Array.new
client.list_members(yaml["list_slug"]).each do |user|
  list_members << user.id
end
puts "List:#{yaml["list_slug"]} has #{list_members.size} members"

# フォローのメンバーを取得
current_follow = client.friend_ids().to_a
puts "Now Following #{current_follow.length} User"

# Autumnにリストされているメンバー以外、リムーブ
remove_list = current_follow - list_members
puts "Unfollow #{remove_list.length} User..."
puts "Estimated Time #{remove_list.length * 5}"

remove_list.each do | id |
  client.unfollow(id)
  puts "Remove : #{id}"
  sleep(5)
end

# Autumnにあって、Followしていないメンバーをフォローする
follow_add = list_members - current_follow
follow_add.each do | id |
  client.follow(id)
  puts "Follow #{id}"
  sleep(10)
end
