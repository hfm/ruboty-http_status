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
          message.reply(reason_phrase)
        end

        def reason_phrase
          doc = parse

          # If url doesn't exist,
          # httpstatus.es returns 500 Internal Server Error
          if doc == '500'
            "HTTP Status Code #{code} doesn't exist."
          else
            doc.at_xpath(xpath).text
          end
        end

        def xpath
          '//div[@id="wrapper"]/div[@class="header"]/span[@class="status_title"]'
        end

        def parse
          html = open(url) { |f| f.read }
          Nokogiri::HTML.parse(html, nil, nil)
        rescue OpenURI::HTTPError => error
          error.io.status.first
        end

        def url
          "http://httpstatus.es/#{code}"
        end
      end
    end
  end
end
