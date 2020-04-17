SemanticLogger.add_appender(
    appender: :splunk_http,
    url:      'https://splunk:8088/services/collector/event',
    token:    '28819799-f892-401e-bffa-34f7b43c7d6a'
)

# SemanticLogger.add_appender(file_name: 'sample.log')
