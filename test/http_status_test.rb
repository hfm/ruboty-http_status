require 'test_helper'

class TestHttpStatus < Test::Unit::TestCase
  sub_test_case 'Return a description of HTTP Status Code' do
    setup do
      message = {}
      message[:code] = 200
      @http_status = Ruboty::HttpStatus::Actions::HttpStatus.new(message)
    end

    test 'call methods return Continue' do
      assert_equal('OK', @http_status.status[200])
    end
  end

  sub_test_case 'Return an error for unknown HTTP Status Code' do
    setup do
      message = {}
      message[:code] = 900
      @http_status = Ruboty::HttpStatus::Actions::HttpStatus.new(message)
    end

    test 'call methods return error' do
      assert_nil @http_status.status[900]
    end
  end
end
