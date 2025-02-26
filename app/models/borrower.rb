class Borrower < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :books, through: :loans
  
  validates :name, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, allow_blank: true
  
  def current_loans
    loans.where(returned_date: nil)
  end
  
  def borrowed_books
    books.distinct
  end
end