require 'twitter'

# TwitterAPI認証
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

# APIでリストAutumnのメンバーを取得
client.list_members("autumn1").each{ |user|
  puts user.id
}

# APIでフォローのメンバーを取得

# Autumnにないフォローメンバーをリムーブ対象メンバーとしてリストアップ

# リムーブリストに従ってリムーブ実行
