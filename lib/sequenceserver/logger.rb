require 'logger'

module SequenceServer

  class Logger < Logger

    def initialize(dev, verbose = false)
      super dev
      self.level     = verbose ? DEBUG : INFO
      self.formatter = Formatter.new
    end

    # We change Logging format so that it is consistent with Sinatra's
    class Formatter < Formatter

      Format = "[%s] %s  %s\n"

      def initialize
        self.datetime_format = "%Y-%m-%d %H:%M:%S"
      end

      def call(severity, time, progname, msg)
        Format % [format_datetime(time), severity, msg2str(msg)]
      end
    end
  end
end
