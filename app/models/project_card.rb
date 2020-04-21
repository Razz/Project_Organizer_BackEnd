require 'opentracing'
class ProjectCard < ApplicationRecord
    scope = OpenTracing.start_active_span('application_record')
    belongs_to :user
    has_many :schedule_entries
    has_many :to_dos
end
