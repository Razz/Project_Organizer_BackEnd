module Logentries
    class Formatter < SemanticLogger::Formatters::Json
      attr_accessor :token
  
      def initialize(token)
        @token = token
      end
  
      def call(log, logger)
        "#{token} #{super(log, logger)}"
      end
    end
end

formatter = Logentries::Formatter.new('1314cca4-91d1-4588-9faa-1f31fd332d30')
SemanticLogger.add_appender(appender: :tcp, server: 'splunk:4000', ssl: false, formatter: formatter)

# SemanticLogger.add_appender(file_name: 'sample.log')
