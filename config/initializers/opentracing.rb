require 'opentracing' # Start tracing here since this is the earliest point in rails init.
require 'jaeger/client'

OpenTracing.global_tracer = Jaeger::Client.build(
  host: ENV['JAEGER_HOST'],
  port: ENV['JAEGER_PORT'],
  service_name: 'sre-webinar-app_backend'
)
