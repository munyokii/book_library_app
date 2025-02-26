class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
  
  validates :borrowed_date, presence: true
  validates :due_date, presence: true
  validate :due_date_after_borrowed_date
  validate :returned_date_after_borrowed_date
  validate :book_available_for_loan, on: :create
  
  after_create :mark_book_unavailable
  after_update :update_book_availability, if: :saved_change_to_returned_date?
  
  private
  
  def due_date_after_borrowed_date
    return if due_date.blank? || borrowed_date.blank?
    
    if due_date < borrowed_date
      errors.add(:due_date, "must be after the borrowed date")
    end
  end
  
  def returned_date_after_borrowed_date
    return if returned_date.blank? || borrowed_date.blank?
    
    if returned_date < borrowed_date
      errors.add(:returned_date, "must be after the borrowed date")
    end
  end
  
  def book_available_for_loan
    return unless book
    
    if book.on_loan?
      errors.add(:book, "is already on loan")
    end
  end
  
  def mark_book_unavailable
    book.update(available: false)
  end
  
  def update_book_availability
    book.update_availability
  end
end
