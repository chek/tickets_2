class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.where('email != ?', current_user.email)
    return render json: {users: @users}, :status => 200
  end

  # POST /users/update_role
  def update_role
    @user = User.find(params[:id])
    @user.role = params[:role]
    @user.save
    return render json: {user: @user}, :status => 200
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
    sign_out(current_user)
    return render json: nil, :status => 200
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(ticket_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if user.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
