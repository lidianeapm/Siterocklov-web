require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")
Mongo::Logger.logger.level = ::Logger::INFO

class MongoDB
  attr_accessor :users, :equipos

  def initialize 
    client = Mongo::Client.new(CONFIG["mongo"])
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({ email: email })  
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user ? user[:_id] : nil
  end

  def remove_equipo(name, email)
    user_id = get_user(email)
    return unless user_id
    @equipos.delete_many({ name: name, user: user_id })  
  end
end
