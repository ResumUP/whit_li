module WhitLi
  module Errors
    class WhitLiError < StandardError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    class UnauthorizedError      < WhitLiError; end
    class GeneralError           < WhitLiError; end
    class AccessDeniedError      < WhitLiError; end

    class UnavailableError       < WhitLiError; end
    class InformLinkedInError    < WhitLiError; end
    class NotFoundError          < WhitLiError; end
  end
end