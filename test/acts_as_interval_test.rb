require 'test_helper'

class ActsAsIntervalTest < ActiveSupport::TestCase
  def test_future_interval_method
    interval = Interval.new
    assert_equal true, interval.respond_to?(:future_intervals)
  end
  def test_past_interval_method
    interval = Interval.new
    assert_equal true, interval.respond_to?(:past_intervals)
  end
  def test_overlapping_interval_method
    interval = Interval.new
    assert_equal true, interval.respond_to?(:overlapping_intervals)
  end
  def test_intervals_before
    old_interval = Interval.create(starts_at: 1.month.ago, ends_at: 1.week.ago)
    older_interval = Interval.create(starts_at: 2.year.ago, ends_at: 1.year.ago)
    Interval.create(starts_at: 1.month.since, ends_at: 1.year.since)
    Interval.create(starts_at: 1.years.ago, ends_at: 1.years.since)
    new_interval = Interval.create(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    assert_equal new_interval.past_intervals, [old_interval, older_interval]
  end
  def test_intervals_after
    Interval.create(starts_at: 1.month.ago, ends_at: 1.week.ago)
    Interval.create(starts_at: 2.year.ago, ends_at: 1.year.ago)
    after_interval = Interval.create(starts_at: 1.month.since, ends_at: 1.year.since)
    Interval.create(starts_at: 1.years.ago, ends_at: 1.years.since)
    new_interval = Interval.create(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    assert_equal new_interval.future_intervals, [after_interval]
  end
end
