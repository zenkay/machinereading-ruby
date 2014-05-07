require "machinereading/version"
require "machinereading/element"

module Machinereading

  def self.configure(&block)
    yield @config ||= Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    attr_accessor :api_key, :endpoint
  end

  class BadResponse < Exception; end
end
