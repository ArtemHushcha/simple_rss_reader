class ApplicationController < ActionController::API
  # Built-in exceptions
  rescue_from ArgumentError, with: :unprocessable_entity

  # Controller exceptions
  rescue_from ActionController::BadRequest, with: :bad_request
  rescue_from ActionController::ParameterMissing, with: :bad_request

  # DB exceptions
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def unprocessable_entity(e)
    render json: { error: e.message }, status: 422
  end

  def not_found(e)
    render json: { error: e.message }, status: 404
  end

  def bad_request(e)
    render json: { error: e.message }, status: 400
  end
end
