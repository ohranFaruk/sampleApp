class UsersController < ApplicationController
  def new
    @user = User.new #forma zna da je post zbog ovog User.new?
  end

  def show
    @user = User.find(params[:id])

  end


  def create
    @user = User.new(user_params)
    #user params se radi kako bi onemogucili da svi parametri sa modela idu metodu, jer moze biti i vaznih stvari u post zahtjevu
    # Not the final implementation!
    if @user.save
      # Handle a successful save.

       flash[:success] = "Welcome to the Sample App!"
       log_in @user
       remember  @user
       redirect_to @user # ili redirect_to user_url(@user)
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user)
           .permit(:name, :email, :password, :password_confirmation)
  end

def destroy
  log_out
  redirect_to root_url
end


end


