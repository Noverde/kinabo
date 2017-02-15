module Cnabs
  def self.config
    @config ||= Cnabs::Configuration.new
    yield @config if block_given?
    @config
  end
end

require 'hashie'
require "cnabs/version"
require 'cnabs/utils'
require 'cnabs/configuration'
require 'active_support/inflector/transliterate'
require 'active_support/core_ext/string'

require 'cnabs/bradesco/remessa/transacao'
require 'cnabs/bradesco/remessa/header'
require 'cnabs/bradesco/remessa/trailler'
require 'cnabs/bradesco/remessa/boleto'

require 'cnabs/bradesco/remessa/builder'
# require 'cnabs/bradesco/retorno'
