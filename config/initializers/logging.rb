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

raise "Please define SPLUNK_HOST and SPLUNK_PORT" \
  if ENV['SPLUNK_HOST'].nil? or ENV['SPLUNK_PORT'].nil?
formatter = Logentries::Formatter.new('1314cca4-91d1-4588-9faa-1f31fd332d30')
log_level = if ENV['LOG_LEVEL'].present?
              ENV['LOG_LEVEL'].downcase.strip.to_sym
            elsif config.log_level.present?
              config.log_level
            else
              :debug
            end
SemanticLogger.add_appener(
  appender: :tcp,
  server: ENV['SPLUNK_HOST']:ENV['SPLUNK_PORT'],
  formatter: formatter,
  ssl: false
)
SemanticLogger.add_appender(
  io: STDOUT,
  level: log_level
  formatter: config.rails_semantic_logger.format
)
