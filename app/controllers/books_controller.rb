class BooksController < ApplicationController

  def index
  @books=Book.all
  @book=Book.new
  @user=current_user

  end

    def show
  @book = Book.new
  @book = Book.find(params[:id])

end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book), notice:  "successfully"
  else
    @books = Book.all
    render :index

end


  end

  def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
  else
    redirect_to books_path
  end

end

 def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice:  "successfully"
  else
    render :edit
end
  end


def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path, notice:  "successfully"
end

  private

  def book_params
      params.require(:book).permit(:title, :body)

  end

    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end