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
      def self.included(klass)
        klass_name = klass.name.underscore.pluralize
        define_method "past_#{klass_name}" do
          self.class.where('ends_at <= ?', self.send(start_field))
        end
        define_method "future_#{klass_name}" do
          self.class.where('starts_at >= ?', self.send(end_field))
        end
        define_method "overlapping_#{klass_name}" do
          self.class.where("TIMEDIFF(#{start_field}, :my_end) * TIMEDIFF(:my_start, #{end_field}) >= 0", my_start: self.send(start_field), my_end: self.send(end_field)).where.not(id: self.id)
        end
        alias_method :intervals_before, "past_#{klass_name}"
        alias_method :intervals_after, "future_#{klass_name}"
      end
    end
  end
end
ActiveRecord::Base.send :include, ActsAsInterval::ActsAsInterval
