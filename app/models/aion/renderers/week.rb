module Aion
  module Renderers
    class Week
      def initialize(events: [], start_day: :monday, target_date: Date.today)
        @events = events
        @start_day = start_day
        @target_date = target_date
      end

      def partial_name
        "aion/layouts/week"
      end

      def dates
        (beginning_of_week..end_of_week)
      end

      def time_range_for_day
        start_datetime = DateTime.now.utc.beginning_of_day.to_i
        end_datetime = DateTime.now.utc.end_of_day.to_i

        (start_datetime..end_datetime)
      end

      def beginning_of_week
        target_date.beginning_of_week(start_day)
      end

      def end_of_week
        target_date.end_of_week(start_day)
      end

      private

      attr_reader :events, :start_day, :target_date
    end
  end
end
