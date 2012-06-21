#
# Christophe Hamerling - Linagora
#
module Playit
  module Services
    class Governance
      class << self

        def start
          puts '[INFO] Start governance...'
        end

        def stop
          puts '[INFO] Stop governance...'
        end

        #
        # Display the governance topics
        #
        def topics
          puts '[INFO] Getting topics...'
          url = "#{Playit.config.attributes["governance"]}/getTopics"
          open(url) { |f|
            f.each_line {
                |line| puts line
            }
          }
        end
      end
    end
  end
end
