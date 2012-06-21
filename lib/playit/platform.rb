#
# Christophe Hamerling - Linagora
#
module Playit
  class Platform
    class << self
      # Public: tests if currently running on darwin.
      #
      # Returns true if running on darwin (MacOS X), else false
      def darwin?
        !!(RUBY_PLATFORM =~ /darwin/)
      end

      # Public: tests if currently running on windows.
      #
      # Apparently Windows RUBY_PLATFORM can be 'win32' or 'mingw32'
      #
      # Returns true if running on windows (win32/mingw32), else false
      def windows?
        !!(RUBY_PLATFORM =~ /mswin|mingw/)
      end

      # Public: returns the command used to open a file or URL
      # for the current platform.
      #
      # Currently only supports MacOS X and Linux with `xdg-open`.
      #
      # Returns a String with the bin
      def open_command
        if darwin?
          'open'
        elsif windows? 
          'start'
        else
          'xdg-open'
        end
      end

      # Public: opens a given Item's value in the browser. This
      # method is designed to handle multiple platforms.
      #
      # Returns a String of the Item value.
      def open(url)
        unless windows?
          system("#{open_command} '#{url.gsub("\'","'\\\\''")}'")
        else
          system("#{open_command} #{url.gsub("\'","'\\\\''")}")
        end
        url
      end

      # Public: returns the command used to copy a given Item's value to the
      # clipboard for the current platform.
      #
      # Returns a String with the bin
      def copy_command
        if darwin?
          'pbcopy'
        elsif windows?
          'clip'
        else
          'xclip -selection clipboard'
        end
      end

      # Public: opens the JSON file in an editor for you to edit. Uses the
      # $EDITOR environment variable, or %EDITOR% on Windows for editing.
      # This method is designed to handle multiple platforms.
      # If $EDITOR is nil, try to open using the open_command.
      #
      # Returns a String with a helpful message.
      def edit(file)
        unless $EDITOR.nil?
          unless windows?
            system("`echo $EDITOR` #{file} &")
          else
            system("start %EDITOR% #{file}")
          end
        else
          system("#{open_command} #{file}")
        end

        "Make your edits, and do be sure to save."
      end
    end
  end
end
