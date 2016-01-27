require 'nokogiri'
require 'open-uri'

module Ruboty
  module HttpStatus
    module Actions
      class HttpStatus < Ruboty::Actions::Base
        attr_reader :message, :code

        def initialize(message)
          @message = message
          @code = message[:code]
        end

        def call
          message.reply(result)
        end

        def result
          `curl -sS -I #{url} | head -1 | cut -d' ' -f2-`.chomp
        end

        def url
          "http://httpstat.us/#{code}"
        end
      end
    end
  end
end
