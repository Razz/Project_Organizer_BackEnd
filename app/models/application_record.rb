require 'opentracing'
class ApplicationRecord < ActiveRecord::Base
  scope = OpenTracing.start_active_span('application_record')
  self.abstract_class = true
end
