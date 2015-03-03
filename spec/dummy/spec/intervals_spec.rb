require 'spec_helper.rb'
describe Interval, type: :model do
  let!(:interval) { create :interval, starts_at: Date.today, ends_at: 1.week.from_now }
  let!(:past_intervals) { create_list :interval, 3, :past }
  let!(:future_intervals) { create_list :interval, 3, :future }
  let!(:overlapping_intervals) { create_list :interval, 3, :future, starts_at: 3.days.from_now }
  describe '#past_intervals' do
    it 'returns past intervals only' do
      expect(interval.past_intervals).to eq past_intervals
    end
  end
  describe '#future_intervals' do
    it 'returns future intervals only' do
      expect(interval.future_intervals).to eq future_intervals
    end
  end
  describe '#overlapping_intervals' do
    it 'returns overlapping intervals only' do
      expect(interval.overlapping_intervals).to eq overlapping_intervals
    end
  end
end
