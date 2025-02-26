class Book < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :borrowers, through: :loans

  validates :title, presence: true
  validates :author, presence: true
  validates :publication_year, numericality: { 
    allow_nil: true,
    only_integer: true, 
    greater_than_or_equal_to: 1450, 
    less_than_or_equal_to: -> { Date.current.year } 
  }
  
  def current_loan
    loans.where(returned_date: nil).first
  end
  
  def on_loan?
    current_loan.present?
  end
  
  def update_availability
    update(available: !on_loan?)
  end
end
