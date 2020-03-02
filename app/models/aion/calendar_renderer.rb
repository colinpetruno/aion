module Aion
  class CalendarRenderer
    def initialize(display_format: :week, events: [], start_day: :monday,
                   target_date: Date.today)
      @display_format = display_format
      @events = events
      @start_day = start_day
      @target_date = target_date
    end

    def render_calendar_controller
      ApplicationController.render(
        partial: "aion/controllers/calendar",
        locals: {
          renderer: month_renderer
        }
      )
    end

    def render_toolbar_controller
      ApplicationController.render(
        partial: "aion/controllers/toolbar",
        locals: {
          renderer: view_renderer
        }
      )
    end

    def render_calendar
      ApplicationController.render(
        partial: view_renderer.partial_name,
        locals: {
          renderer: view_renderer
        }
      )
    end

    private

    attr_accessor :display_format, :events, :start_day, :target_date

    def view_renderer
      if display_format == :week
        week_renderer
      elsif display_format == :day
        day_renderer
      else
        raise Aion::Errors::InvalidDisplayFormat.new(display_format)
      end
    end

    def month_renderer
      @_month_renderer ||= Aion::Renderers::Month.new(
        events: [],
        start_day: :monday,
        target_date: Date.today
      )
    end

    def week_renderer
      @_week_renderer ||= Aion::Renderers::Week.new(
        events: [],
        start_day: :monday,
        target_date: Date.today
      )
    end

    def day_renderer
    end
  end
end
