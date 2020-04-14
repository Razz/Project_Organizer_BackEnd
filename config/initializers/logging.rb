SemanticLogger.add_appender(
    appender: :splunk_http,
    url:      'http://splunk:8088/services/collector/event/',
    token:    '28819799-f892-401e-bffa-34f7b43c7d6a'
    # token:    'c18201f6-3a0f-4781-9cf0-91c2acabd3be'
)

# SemanticLogger.add_appender(file_name: 'sample.log')
