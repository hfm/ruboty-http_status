module Ruboty
  module HttpStatus
    module Actions
      class HttpStatus < Ruboty::Actions::Base
        attr_reader :message, :code

        def initialize(message)
          @message = message
          @code = message[:code].to_i
        end

        def call
          message.reply(status[code])
        end

        def status
          {
            100 => 'Continue',
            101 => 'Switching Protocols',
            102 => 'Processing (WebDAV)',

            200 => 'OK',
            201 => 'Created',
            202 => 'Accepted',
            203 => 'Non-Authoritative Information',
            204 => 'No Content',
            205 => 'Reset Content',
            206 => 'Partial Content',
            207 => 'Multi-Status (WebDAV)',
            208 => 'Already Reported (WebDAV)',
            226 => 'IM Used',

            300 => 'Multiple Choices',
            301 => 'Moved Permanently',
            302 => 'Found',
            303 => 'See Other',
            304 => 'Not Modified',
            305 => 'Use Proxy',
            306 => 'Switch Proxy (Unused)',
            307 => 'Temporary Redirect',
            308 => 'Permanent Redirect',

            400 => 'Bad Request',
            401 => 'Unauthorized',
            402 => 'Payment Required',
            403 => 'Forbidden',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            406 => 'Not Acceptable',
            407 => 'Proxy Authentication Required',
            408 => 'Request Timeout',
            409 => 'Conflict',
            410 => 'Gone',
            411 => 'Length Required',
            412 => 'Precondition Failed',
            413 => 'Payload Too Large',
            414 => 'URI Too Long',
            415 => 'Unsupported Media Type',
            416 => 'Range Not Satisfiable',
            417 => 'Expectation Failed',
            418 => 'I\'m a teapot',
            420 => 'Enhance Your Calm (Twitter)',
            421 => 'Misdirected Request',
            422 => 'Unprocessable Entity (WebDAV)',
            423 => 'Locked (WebDAV)',
            424 => 'Failed Dependency (WebDAV)',
            426 => 'Upgrade Required',
            428 => 'Precondition Required',
            429 => 'Too Many Requests',
            431 => 'Request Header Fields Too Large',
            444 => 'No Response (nginx)',
            451 => 'Unavailable For Legal Reasons',
            495 => 'SSL Certificate Error (nginx)',
            496 => 'SSL Certificate Required (nginx)',
            497 => 'HTTP Request Sent to HTTPS Port (nginx)',
            499 => 'Client Closed Request (nginx)',

            500 => 'Internal Server Error',
            501 => 'Not Implemented',
            502 => 'Bad Gateway',
            503 => 'Service Unavailable',
            504 => 'Gateway Timeout',
            505 => 'HTTP Version Not Supported',
            506 => 'Variant Also Negotiates',
            507 => 'Insufficient Storage (WebDAV)',
            508 => 'Loop Detected (WebDAV)',
            509 => 'Bandwidth Limit Exceeded (Apache)',
            510 => 'Not Extended',
            511 => 'Network Authentication Required',
          }
        end
      end
    end
  end
end
