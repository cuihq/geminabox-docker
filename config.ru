require 'yaml'
require 'geminabox'

Geminabox.data = "#{File.dirname(__FILE__)}/data"

default_config = {
  'rubygems_proxy' => true,
  'allow_upload' => false,
  'allow_delete' => false,
  'allow_replace' => false,
  'styling' => 'bootstrap',
  'auth' => false
}.freeze
config_file = "#{File.dirname(__FILE__)}/data/config.yml"
File.write(config_file, default_config.to_yaml) unless File.exist? config_file

config = YAML.load_file config_file
%w(rubygems_proxy allow_upload allow_delete allow_replace).each do |name|
  value = config[name] || default_config[name]
  Geminabox.send("#{name}=", value)
end

if config['styling'] == 'bootstrap'
  Geminabox.views = "#{File.dirname(__FILE__)}/views"
  Geminabox.public_folder = "#{File.dirname(__FILE__)}/public"
end

if config['auth']
  use Rack::Auth::Basic, "GemInAbox" do |username, password|
    config['auth'] == [username, password]
  end
end

run Geminabox::Server
