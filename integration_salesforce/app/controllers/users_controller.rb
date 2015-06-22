class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new("name"=>params[:name], "lastname"=>params[:lastname], "email"=>params[:email], "company"=>params[:company], "jobtitle"=>params[:jobtitle], "phone"=>params[:phone], "website"=>params[:website])
    respond_to do |format|
    puts params
    session[:user] = params[:id]
      if @user.save
        session[:user] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
    @user = User.find(params[:id])
    
      if @user.update_attributes(user_params)
        respond_to do |format|
          format.html { redirect_to user_path + '?message=editok', notice: 'User was successfully edited.' }
          format.json { render :show, status: :ok, location: @user }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lastname, :email, :company, :jobtitle, :phone, :website)
    end
end
