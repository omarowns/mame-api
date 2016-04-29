require 'test_helper'

class RunnerServiceTest < ActiveSupport::TestCase

  test 'mame service can create new mames' do
    opts = {
      command: 'new',
      args: 'texto de mame @omar'
    }
    Mames::RunnerService.new(opts).call
    assert Mame.count == 1, 'Mame wasnt created'
  end

  test 'mame service can delete mames' do
    mame = Mame.create(text: 'texto', author: '@omar')
    opts = {
      command: 'delete',
      args: mame.id
    }
    Mames::RunnerService.new(opts).call
    assert Mame.count == 0, 'Mame was not deleted'
  end

  test 'mame service can find all mames by author' do
    Mame.create(text: 'texto1', author: '@omar')
    Mame.create(text: 'texto2', author: '@omar')
    Mame.create(text: 'texto3', author: '@omar')
    Mame.create(text: 'texto4', author: '@john')
    Mame.create(text: 'texto5', author: '@jane')

    opts = {
      command: 'get',
      args: '@omar'
    }
    mames = Mames::RunnerService.new(opts).call
    assert mames.length == 3
  end

  test 'mame service can calculate a score' do
    Mame.create(text: 'texto1', author: '@omar')
    Mame.create(text: 'texto2', author: '@omar')
    Mame.create(text: 'texto3', author: '@omar')
    Mame.create(text: 'texto4', author: '@john')
    Mame.create(text: 'texto5', author: '@jane')

    opts = {
      command: 'score'
    }
    score = Mames::RunnerService.new(opts).call
    assert score['@omar'] == 3, "Score mismatch with @omar"
    assert score['@john'] == 1, "Score mismatch with @john"
    assert score['@jane'] == 1, "Score mismatch with @jane"
  end

  test 'mame service can calculate a score for a given author' do
    Mame.create(text: 'texto1', author: '@omar')
    Mame.create(text: 'texto2', author: '@omar')
    Mame.create(text: 'texto3', author: '@omar')
    Mame.create(text: 'texto4', author: '@john')
    Mame.create(text: 'texto5', author: '@jane')

    opts = {
      command: 'score',
      args: '@omar'
    }
    score = Mames::RunnerService.new(opts).call
    assert score['@omar'] == 3, "Score mismatch with @omar"
    assert score.length == 1, "Score mas more than one author"
  end
end
