#
# Christophe Hamerling - Linagora
#
module Playit
  module Services
  class Bootstrap
    class << self

      def init
        puts '[INFO] Init bootstrap service...'
        url = "#{Playit.config.attributes["bootstrap"]}/rest/init"
        open(url) { |f|
          f.each_line {
            |line| puts line
          }
        }
      end

      def stop
        puts '[INFO] Stop bootstrap service...'
        puts '[INFO] TODO!'
      end

      def restart
        stop
        start
      end
    end
  end
  end
end
