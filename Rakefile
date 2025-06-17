require "digest/md5"
require_relative "features/support/mongo_config"
require_relative "features/support/libs/mongo"

def to_md5(pass)
  Digest::MD5.hexdigest(pass)
end

task :seeds do 
  users = [
    { name: "Lidiane Serafim", email: "lidianeaserafim@gmail.com", password: to_md5("pwd123") },
    { name: "Lucas Serafim", email: "lucas_serafin@hotmail.com", password: to_md5("pwd123") }
  ]

  MongoDB.new.drop_danger
  MongoDB.new.insert_users(users)

  puts "✅ Banco de dados populado com sucesso!"
end
