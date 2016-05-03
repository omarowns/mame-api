require 'test_helper'

class FormatterServiceTest < ActiveSupport::TestCase

  test 'formatter service can parse GET command' do
    setup_mames

    arguments = {
      command: 'get'
    }
    service_response = Mame.all

    formatted_response = Mames::FormatterService.new(arguments, service_response).call
    assert formatted_response.kind_of? String
  end

  test 'formatter service can parse SCORE command' do
    setup_mames

    arguments = {
      command: 'score'
    }
    service_response = Mame.all

    formatted_response = Mames::FormatterService.new(arguments, service_response).call
    assert formatted_response.kind_of? String
  end

  def setup_mames
    Mame.create(text: "Wiuwiu", author: "@omar")
    Mame.create(text: "Wiuwiu", author: "@omar")
    Mame.create(text: "Wiuwiu", author: "@john")
    Mame.create(text: "Wiuwiu", author: "@jane")
  end
end
