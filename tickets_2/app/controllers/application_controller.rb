class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user_customer?
    if current_user.blank? or current_user.role != UserRole::CUSTOMER
      return render json: {}, :status => 401
    end
  end

  def current_user_admin?
    if current_user.blank? or current_user.role != UserRole::ADMIN
      return render json: {}, :status => 401
    end
  end

end
