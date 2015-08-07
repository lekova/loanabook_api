class BooksController < OpenReadController

  def index
    if params[:limit]
      books = current_user ? current_user.books : []
    else
      books = Book.all.order('id ASC')
    end

    render json: books
  end

  def show
    render json: Book.find(params[:id])
  end

  def show_my_books
    render json: Book.find_by(book_params_with_user_id["owner_id"])
  end

  def create
    book = Book.create(book_params_with_user_id)
    if book.save!
      render json: book
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update!(book_params)
      render json: book
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
  end

  private
  def book_params
    # TODO add summary
    params.require(:book).permit(:title, :author, :year, :price, :url, :status)
  end

  def book_params_with_user_id
    current_params = book_params
    current_params["owner_id"] = current_user.id
    current_params["status"] = 0
    current_params
  end
end
