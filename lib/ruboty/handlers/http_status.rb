module Ruboty
  module Handlers
    class HttpStatus < Base
      on(
        /^http (?<code>\d{3})$/,
        name: 'code',
        all: true,
        description: 'Display HTTP Status Codes'
      )

      on(
        /(?<code>\d{3})/,
        name: 'code',
        description: 'Display HTTP Status Codes'
      )

      def code(message)
        Ruboty::HttpStatus::Actions::HttpStatus.new(message).call
      end
    end
  end
end
