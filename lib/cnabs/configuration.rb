require 'erb'
require 'yaml'

module Cnabs
  class Configuration
    attr_accessor :environment, :logger, :config_file_path

    def config_file_path
      @config_file_path || 'config/cnabs.yml'
    end

    def environment
      @environment || ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
    end

    def bradesco
      config[:bradesco]
    end

    private

    def config
      @config ||= Hashie::Mash.load(config_file_path)[environment]
    end
  end
end
