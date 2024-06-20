class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  # GET /users or /users.json
  def index
    if params[:search].present?
      @users = User.where('username ILIKE ?', "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @albums = @user.albums
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :username, :email, :phone, :website,
      address_attributes: [:id, :street, :suite, :city, :zipcode, geo_attributes: [:id, :lat, :lng]],
      company_attributes: [:id, :name, :catchPhrase, :bs]
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
