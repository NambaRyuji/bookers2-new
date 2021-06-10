class UsersController < ApplicationController

 def index
 @users=User.all
 @book = Book.new


 end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to  book_path(@book)
end
  def show
       @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.reverse_order

  end
def edit
  @user = User.find(params[:id])
   if @user == current_user
  else
    redirect_to user_path(current_user.id)
  end
end


  def update
  @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice:  "successfully"
  else
render :edit
end
  end



 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
