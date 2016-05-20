require 'dotenv'
Dotenv.load

cookbook_path ['cookbooks']
node_path 'nodes'
role_path 'roles'
environment_path 'environments'
data_bag_path 'data_bags'

env = ENV['CHEF_ENV'] || 'development'
encrypted_data_bag_secret ENV["CHEF_ENCRYPTED_DATA_BAG_SECRET_#{env.upcase}"] || "encrypted_data_bag_secret/#{env}"

knife[:environment] = env
knife[:berkshelf_path] = 'cookbooks'
