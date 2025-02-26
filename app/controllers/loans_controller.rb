class LoansController < ApplicationController
  before_action :set_book
  
  def create
    @borrower = Borrower.find(params[:loan][:borrower_id])
    
    @loan = @book.loans.new(loan_params)
    @loan.borrower = @borrower
    @loan.borrowed_date = Date.today
    @loan.due_date = Date.today + 14.days
    
    if @loan.save
      redirect_to @book, notice: "Book was successfully borrowed by #{@borrower.name}."
    else
      redirect_to @book, alert: @loan.errors.full_messages.join(", ")
    end
  end
  
  def update
    @loan = @book.current_loan
    
    if @loan
      @loan.returned_date = Date.today
      
      if @loan.save
        redirect_to @book, notice: 'Book was successfully returned.'
      else
        redirect_to @book, alert: @loan.errors.full_messages.join(", ")
      end
    else
      redirect_to @book, alert: 'This book is not currently on loan.'
    end
  end
  
  private
  
  def set_book
    @book = Book.find(params[:book_id])
  end
  
  def loan_params
    params.require(:loan).permit(:borrower_id, :due_date)
  end
end
