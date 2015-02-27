require 'test_helper'

class ActsAsIntervalTest < ActiveSupport::TestCase
  def test_intervals_before
    old_interval = Interval.create(starts_at: 1.month.ago, ends_at: 1.week.ago)
    older_interval = Interval.create(starts_at: 2.year.ago, ends_at: 1.year.ago)
    Interval.create(starts_at: 1.month.since, ends_at: 1.year.since)
    Interval.create(starts_at: 1.years.ago, ends_at: 1.years.since)
    new_interval = Interval.create(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    assert_equal new_interval.intervals_before, [old_interval, older_interval]
  end
  def test_intervals_after
    Interval.create(starts_at: 1.month.ago, ends_at: 1.week.ago)
    Interval.create(starts_at: 2.year.ago, ends_at: 1.year.ago)
    after_interval = Interval.create(starts_at: 1.month.since, ends_at: 1.year.since)
    Interval.create(starts_at: 1.years.ago, ends_at: 1.years.since)
    new_interval = Interval.create(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    assert_equal new_interval.intervals_after, [after_interval]
  end
  def test_intersecting_intervals
    my_interval = Interval.create(starts_at: 1.days.ago, ends_at: 1.days.since)
    Interval.create(starts_at: 1.year.ago, ends_at: 1.month.ago)
    Interval.create(starts_at: 1.year.since, ends_at: 2.years.since)
    intersecting_interval = Interval.create(starts_at: 1.month.ago, ends_at: 1.month.since)
    assert_equal my_interval.overlapping_intervals, [intersecting_interval]
  end
end
