class BooksController < ApllicationController
  def index
    render json: Books.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    book = book.create(book_params)
    if book.save
      head :created, location: book
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
    params.require(:book).permit(:title, :author, :year, :price)
  end
end
