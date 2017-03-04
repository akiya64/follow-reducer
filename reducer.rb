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
client.list_members("autumn1").each{ |user|
  puts user.id
}

# APIでフォローのメンバーを取得

# Autumnにないフォローメンバーをリムーブ対象メンバーとしてリストアップ

# リムーブリストに従ってリムーブ実行
