class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
  #   redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    # 消した後に一覧を出すために必要
    @comment = BookComment.find(params[:id])
    # @comment.user_id = current_user.id
    # これ全部消えない？やっぱり全部消える、というか他の本のコメントも消える→findparamsにして、idをしっかり送る
    @comment.destroy
    # redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
