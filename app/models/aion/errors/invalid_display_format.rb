module Aion
  module Errors
    class InvalidDisplayFormat < StandardError
      def initialize(invalid_type)
        @invalid_type = invalid_type
      end

      def message
        I18n.t(
          "aion.errors.invalid_display_format",
          invalid_type: @invalid_type
        )
      end
    end
  end
end
