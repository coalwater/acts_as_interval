class Interval < ActiveRecord::Base
  acts_as_interval start: :starts_at, end: :ends_at
end
