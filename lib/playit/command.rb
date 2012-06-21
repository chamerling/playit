#
# Christophe Hamerling - Linagora
#
##
## Playit! Play management tool
##
## Options:
##
## - configure
##       Open the system editor to fill properties, check Play Wiki for details
##
## - boostrap init/stop/restart
##       Create the links between the Play components (Service Bus, Event Cloud, DCEP, ...)
##
## - meta start/stop/restart
##       Will reload metadata service from fresh data
##
## - topics
##       Get the current available topics
##
## - status
##       Displays current status/configuration
##
## - help
##       Displays this message...
##
## PlayFP7 project - Christophe Hamerling - Linagora
##
module Playit
  class Command

    class << self

      def execute(*args)
        command = args.shift
        major = args.shift
        minor = args.empty? ? nil : args.join(' ')

        return overview unless command
        delegate(command, major, minor)
      end

      def delegate command, major, minor

        return configure          if command == 'configure'
        return bootstrap(major)   if command == 'bootstrap'
        return metadata(major)    if command == 'meta'
        return topics             if command == 'topics'
        return status             if command == 'status'
        return overview           if command == 'help'

        return overview

      end

      #
      # Edit the configuration in an editor
      #
      def configure
        puts "Playit! #{Platform.edit(Playit.config.file)}"
      end

      def overview
        puts usage
      end

      def usage
        File.readlines(__FILE__).
        grep(/^##.*/).
        map { |line| line.chomp[3..-1] }.
        join("\n")
      end

      def metadata(operation)
        return Playit::Services::Metadata.start if operation == 'start'
        return Playit::Services::Metadata.stop if operation == 'stop'
        return Playit::Services::Metadata.restart if operation == 'restart'

        "Invalid operation #{operation} for metadata service"
      end

      def bootstrap(operation)
        return Playit::Services::Bootstrap.init if operation == 'init'
        return Playit::Services::Bootstrap.stop if operation == 'stop'

        "Invalid operation #{operation} for bootstrap service"
      end

      def topics
        Playit::Services::Governance.topics
      end

    end

  end
end
