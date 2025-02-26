class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @loans = @book.loans.includes(:borrower).order(borrowed_date: :desc)
    @loan = Loan.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.available = true unless @book.available.present?

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.on_loan?
      redirect_to @book, alert: 'Cannot delete a book that is currently on loan.'
    else
      @book.destroy
      redirect_to books_path, notice: 'Book was successfully deleted.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :publisher, :publication_year, :description, :available)
  end
end
