class UsersController < ApplicationController

  def index
    @user=User.all
    render json:@user.paginate(page: params[:page], per_page: 3)
 end

  def new
    @user=User.new
  end
  def create
     @user = User.new(user_params)
     if @user.save
       render json: @user, status: :created
     else
       render json: @user.errors, status: :unprocessable_entity
     end
   end

 def update
   @user=User.find(params[:id])
   if @user.update(user_params)
     render json: @user
   else
     render json: @user.errors, status: :unprocessable_entity
   end
 end
 def search
  @query = params[:query]
if @query.present?
 @user=User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{@query}%", "%#{@query}%", "%#{@query}%")
 render json: @user
 else
  render json: "user not present"
end
end

 def show
   @user=User.find(params[:id])
   render json:@user
 end
  def destroy
     @user=User.find(params[:id])
    if   @user.delete
      render json:  "user was successfully destroyed."
    end
end

end
 private
 def user_params
   params.require(:user).permit(:first_name, :last_name, :email)
 end
