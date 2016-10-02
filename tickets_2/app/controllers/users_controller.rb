class UsersController < ApplicationController
  before_action :check_current_user_admin, only: [:index, :update_role]

  # GET /users
  # GET /users.json
  def index
    @users = User.where('email != ?', current_user.email)
    return render json: {users: @users}, :status => 200
  end

  # POST /users/update_role
  def update_role
    @user = User.find(params[:id])
    if !@user.blank?
      @user.role = params[:role]
      @user.save
      return render json: {user: @user}, :status => 200
    else
      return render json: {user: @user}, :status => 404
    end
  end

  # POST /users/sign_up_ajax
  def sign_up_ajax
    @user = User.where('email = ?', params[:email]).first
    if @user.blank?
      @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password], :role => UserRole::CUSTOMER)
      @user.save
      return render json: {user_id: @user.id, role: @user.role}, :status => 200
    else
      return render json: nil, :status => 406
    end
  end

  # POST /users/sign_in_ajax
  def sign_in_ajax
    @user = User.where('email = ?', params[:email]).first
    if !@user.blank?
      if @user.valid_password?(params[:password])
        sign_in(:user, @user)
        return render json: {user_id: @user.id, role: @user.role}, :status => 200
      else
        return render json: nil, :status => 401
      end
    else
      return render json: nil, :status => 404
    end
  end

  # POST /users/sign_out_ajax
  def sign_out_ajax
    sign_out(current_user) if !current_user.blank?
    return render json: nil, :status => 200
  end

  private
    def check_current_user_admin
      if current_user.blank? or current_user.role != UserRole::ADMIN
        return render json: {}, :status => 401
      end
    end

end
