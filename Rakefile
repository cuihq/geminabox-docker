# cording: utf-8

desc 'run'
task :run do
  print "Data volume(default #{Dir.pwd}/data): "
  data_volume = STDIN.gets.chomp
  data_volume = "#{Dir.pwd}/data" if data_volume.empty?
  cmd = <<~RUNCMD
    docker run -it -p 9292:9292 \
      -v #{data_volume}:/geminabox/data \
      --name geminabox \
      cuihq/geminabox
  RUNCMD
  sh cmd
end

desc 'build_docker'
task :build_docker do
  sh <<~BUILDCMD
    docker build -t cuihq/geminabox .
  BUILDCMD
end

require "bundler/gem_tasks"

module Bundler
  class GemHelper
    unless method_defined?(:rubygem_push)
      raise NoMethodError, "Monkey patching Bundler::GemHelper#rubygem_push failed: did the Bundler API change???"
    end

    def rubygem_push(path)
      gem_server_url = "http://localhost:9292/"
      sh %{gem push #{path} --host #{gem_server_url}}

      Bundler.ui.confirm "Pushed #{name} #{version} to #{gem_server_url}"
    end
  end
end
