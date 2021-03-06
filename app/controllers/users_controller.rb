class UsersController < ApplicationController


def new
  @user = User.new
end


def show
 @user = User.find(params[:id])
end

def create
  # binding.pry
  @user = User.new user_params
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

private

def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end

end
