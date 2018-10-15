module RenderJson
  extend ActiveSupport::Concern

  def render_json(status = :success, data = {}, message = 'sucesso')
    if status == :success
      render json: {
        status: 'SUCCESS',
        message: message,
        data: data
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: @message_error,
      }, status: :unprocessable_entity
    end
  end
end
