#
# Christophe Hamerling - Linagora
#
module Playit
  class Config

    # The main config file for boom
    FILE = "#{ENV['HOME']}/.playfp7.conf"

    # Public: The attributes Hash for configuration options. The attributes
    # needed are dictated by each backend, but the `backend` option must be
    # present.
    attr_reader :attributes

    # Public: creates a new instance of Config.
    #
    # This will load the attributes from boom's config file, or bootstrap it
    # if this is a new install. Bootstrapping defaults to the JSON backend.
    #
    # Returns nothing.
    def initialize
      bootstrap unless File.exist?(file)
      load_attributes
    end

    # Public: accessor for the configuration file.
    #
    # Returns the String file path.
    def file
      FILE
    end

    # Public: saves an empty, barebones hash to @attributes for the purpose of
    # new user setup.
    #
    # Returns whether the attributes were saved.
    def bootstrap
      @attributes = {
        :governance => 'DEFINE BASE URL',
        :metadata => 'DEFINE BASE URL',
        :bootstrap => 'DEFINE BASE URL',
        :dsb => 'DEFINE DSB URL',
        :seacloud => 'DEFINE SEACLOUD URL'
      }
      save
    end

    # Public: assigns a hash to the configuration attributes object. The
    # contents of the attributes hash depends on what the backend needs. A
    # `backend` key MUST be present, however.
    #
    # attrs - the Hash representation of attributes to persist to disk.
    #
    # Examples
    #
    #     config.attributes = {"backend" => "json"}
    #
    # Returns whether the attributes were saved.
    def attributes=(attrs)
      @attributes = attrs
      save
    end

    # Public: loads and parses the JSON tree from disk into memory and stores
    # it in the attributes Hash.
    #
    # Returns nothing.
    def load_attributes
      @attributes = MultiJson.decode(File.new(file, 'r').read)
    end

    # Public: writes the in-memory JSON Hash to disk.
    #
    # Returns nothing.
    def save
      json = MultiJson.encode(attributes)
      File.open(file, 'w') {|f| f.write(json) }
    end

  end
end
