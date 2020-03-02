module Aion
  module Renderers
    class Month
      attr_reader :events, :start_day, :target_date

      def initialize(events: [], start_day: :monday, target_date: Date.today)
        @events = events
        @start_day = start_day
        @target_date = target_date
      end

      def calendar_start_date
        target_date.beginning_of_month.beginning_of_week(start_day)
      end

      def calendar_end_date
        target_date.end_of_month.end_of_week(start_day)
      end

      def weeks
        (calendar_start_date..calendar_end_date).to_a.in_groups_of(7)
      end

      def classes_for(date)
        output = ["aion-date"]
        output.push("active") if target_date.to_date == date.to_date
        output.push("inactive") if target_date.month != date.month

        output.join(" ")
      end

      def years_for_selection
        (start_year_for_selection..(Date.today.year + 1))
      end

      def months_for_selection
        I18n.t("date.month_names")[1..12]
      end

      def week_days
        start_date = target_date.beginning_of_week(start_day)
        end_date = target_date.end_of_week(start_day)

        (start_date..end_date)
      end

      private

      def start_year_for_selection
        Date.today.year - 2
      end
    end
  end
end
