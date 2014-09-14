class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #before_filter :authorize
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user.attributes = params[:user]
    @user.role_ids = params[:user][:role_ids] if params[:user]
    @user = User.new(params[:user])

    if simple_captcha_valid?
    respond_to do |format|
      if @user.save
        flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { redirect_to tienda_index_path, :notice => 'Tu cuenta se ha creado exitosamente' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { render :action => "new"}
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  else
    redirect_to (:back), notice: "La serie que introdujo no corresponde con la imagen"      
  end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to tienda_path, :notice => 'Tu usuario fue actualizado exitosamente' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :ok }
    end
  end
end
