#
# Christophe Hamerling - Linagora
#
module Playit
  module Services
    class Metadata
      class << self

        def start
          puts '[INFO] Start metadata service...'
          url = "#{Playit.config.attributes["metadata"]}/start"
          puts url
          begin
          open(url) { |f|
            f.each_line {
                |line| puts line
            }
          }
          rescue OpenURI::HTTPError
            puts "[ERROR] Already started! Call stop or restart methods"
          end

        end

        def stop
          puts '[INFO] Stop metadata service...'
          url = "#{Playit.config.attributes["metadata"]}/stop"
          puts url
          open(url) { |f|
            f.each_line {
                |line| puts line
            }
          }
        end

        def restart
          puts '[INFO] Restart metadata service...'
          stop
          start
        end
      end
    end
  end
end
