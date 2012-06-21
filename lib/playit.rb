#
# Christophe Hamerling - Linagora
#
begin
  require 'rubygems'
rescue LoadError
end

require 'open-uri'
require 'highline/import'
require 'multi_json'
require 'fileutils'
require 'pp'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'playit/command'
require 'playit/config'
require 'playit/platform'
require 'playit/services/bootstrap'
require 'playit/services/governance'
require 'playit/services/metadata'

module Playit

  VERSION = '0.0.1'

  extend self

  def config
    @config ||= Playit::Config.new
  end

end
