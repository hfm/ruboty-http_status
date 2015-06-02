require 'test_helper'

class TestHttpStatus < Test::Unit::TestCase
  sub_test_case 'Return a description of HTTP Status Code' do
    setup do
      message = {}
      message[:code] = 100
      @http_status = Ruboty::HttpStatus::Actions::HttpStatus.new(message)
    end

    test 'call methods return Continue' do
      assert_equal('Continue', @http_status.reason_phrase)
    end
  end

  sub_test_case 'Return an error for unknown HTTP Status Code' do
    setup do
      message = {}
      message[:code] = 9999
      @http_status = Ruboty::HttpStatus::Actions::HttpStatus.new(message)
    end

    test 'call methods return error' do
      assert_equal("HTTP Status Code 9999 doesn't exist.", @http_status.reason_phrase)
    end
  end
end
