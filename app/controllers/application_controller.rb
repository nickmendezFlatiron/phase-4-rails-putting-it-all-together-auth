class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid , with: :render_unprocessable_entity

  before_action :authorize_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorize_user
    # if  current_user.errors
    #   return render json: {errors: current_user.errors.full_messages} , status: :unauthorized
    # end
      render json: {errors: ["record invalid"]} ,status: :unauthorized unless current_user
  end 
  private

  def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages} , status: :unprocessable_entity
  end
end

