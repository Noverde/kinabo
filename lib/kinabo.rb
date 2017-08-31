module Kinabo
  class RequiredFieldError < StandardError; end

  def self.config
    @config ||= Kinabo::Configuration.new
    yield @config if block_given?
    @config
  end
end

# work around logger spam from hashie
# https://github.com/intridea/hashie/issues/394
require "hashie"
require "hashie/logger"
Hashie.logger = Logger.new(nil)

require "kinabo/version"
require 'kinabo/utils'
require 'kinabo/configuration'
require 'active_support/inflector/transliterate'
require 'active_support/core_ext/string'

require 'kinabo/bradesco/remessa/header'
require 'kinabo/bradesco/remessa/transacao'
require 'kinabo/bradesco/remessa/mensagem'
require 'kinabo/bradesco/remessa/pagador'
require 'kinabo/bradesco/remessa/trailler'
require 'kinabo/bradesco/remessa/boleto'
require 'kinabo/bradesco/remessa/builder'

require 'kinabo/bradesco/retorno'

require 'fromtis/remessa/header'
require 'fromtis/remessa/transacao'
require 'fromtis/remessa/trailler'
