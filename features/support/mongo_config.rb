require "yaml"

MONGO_CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/mongo.yml"))
