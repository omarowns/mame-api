class ApplicationController < ActionController::API

  def render_success_json(opts = {})
    opts[:response_type] ||= 'in_channel'
    opts[:text] ||= ''
    opts[:attachments] ||= []
    render json: {
      response_type: opts[:response_type],
      text: opts[:text],
      attachments: opts[:attachments]
    }, status: 200
  end

  def render_incorrect_token
    render json: {
      text: 'Incorrect token sent'
    }, status: 200
  end
end
