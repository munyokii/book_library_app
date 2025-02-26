class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
  end

  def show
    @borrower = Borrower.find(params[:id])
    @loans = @borrower.loans.includes(:book).order(borrowed_date: :desc)
  end
  
  def find_or_create
    @borrower = Borrower.find_by(name: borrower_params[:name])
    
    if @borrower.nil?
      @borrower = Borrower.new(borrower_params)
      unless @borrower.save
        return render json: { errors: @borrower.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    render json: { id: @borrower.id, name: @borrower.name }
  end
  
  private
  
  def borrower_params
    params.require(:borrower).permit(:name, :email, :phone)
  end
end
