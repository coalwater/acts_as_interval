module ActsAsInterval
  module ActsAsInterval
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_interval(**options)
        cattr_accessor :start_field, :end_field
        self.start_field = options[:start]
        self.end_field = options[:end]

        include ActsAsInterval::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def intervals_before
        self.class.where('ends_at <= ?', self.send(start_field))
      end
      def intervals_after
        self.class.where('starts_at >= ?', self.send(end_field))
      end
      def overlapping_intervals
        self.class.where("DATEDIFF(#{start_field}, :my_end) * DATEDIFF(:my_start, #{end_field}) >= 0", my_start: self.send(start_field), my_end: self.send(end_field)).where.not(id: self.id)
      end
    end
  end
end
ActiveRecord::Base.send :include, ActsAsInterval::ActsAsInterval
