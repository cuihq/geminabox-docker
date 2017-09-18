require 'yaml'
require 'geminabox'

Geminabox.data = '/geminabox/data'

config_file = "#{File.dirname(__FILE__)}/data/config.yml"
unless File.exist? config_file
  File.write config_file, {
    'allow_upload' => false,
    'allow_delete' => false,
    'styling' => 'bootstrap',
    'auth' => false
  }.to_yaml
end

config = YAML.load_file config_file
Geminabox.allow_upload = config['allow_upload']
Geminabox.allow_delete = config['allow_delete']

if config['styling'] == 'bootstrap'
  Geminabox.views = '/geminabox/views'
  Geminabox.public_folder = '/geminabox/public'
end

if config['auth']
  use Rack::Auth::Basic, "GemInAbox" do |username, password|
    config['auth'] == [username, password]
  end
end

run Geminabox::Server
