class PizzarronController < ApplicationController
  before_action :parse_params, :verify_token

  def mame
    parse_text
    service_response = Mames::RunnerService.new(@arguments).call
    render_success_json text: service_response
  end

  private

  def parse_params
    @token        = params[:token].present? ? params[:token] : ''
    @team_id      = params[:team_id].present? ? params[:team_id] : ''
    @team_domain  = params[:team_domain].present? ? params[:team_domain] : ''
    @channel_id   = params[:channel_id].present? ? params[:channel_id] : ''
    @channel_name = params[:channel_name].present? ? params[:channel_name] : ''
    @user_id      = params[:user_id].present? ? params[:user_id] : ''
    @user_name    = params[:user_name].present? ? params[:user_name] : ''
    @command      = params[:command].present? ? params[:command] : ''
    @text         = params[:text].present? ? params[:text] : ''
    @response_url = params[:response_url].present? ? params[:response_url] : ''
  end

  def parse_text
    opts = {
      command: @text.match(/(\w+)\s?(.*)?/)[1],
      args: @text.match(/(\w+)\s?(.*)?/)[2]
    }
    @arguments = opts
  end

  def verify_token
    render_incorrect_token if token_mismatch
  end

  def token_mismatch
    # While testing we can skip the token
    unless Rails.env == 'test' || request.domain == 'localhost'
      @token != ENV["slack_token"]
    end
  end
end
