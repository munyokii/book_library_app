require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Test Author", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end
  
  test "should not save book with duplicate ISBN" do
    Book.create(title: "Original Book", author: "Test Author", isbn: "1234567890")
    book = Book.new(title: "Duplicate ISBN", author: "Another Author", isbn: "1234567890")
    assert_not book.save, "Saved the book with duplicate ISBN"
  end
  
  test "should not save book with invalid publication year" do
    book = Book.new(title: "Test Book", author: "Test Author", isbn: "1234567890", publication_year: 3000)
    assert_not book.save, "Saved the book with future publication year"
  end
  
  test "should update availability when book is borrowed" do
    book = Book.create(title: "Available Book", author: "Test Author", isbn: "5432109876", available: true)
    borrower = Borrower.create(name: "Test Borrower")
    
    loan = Loan.create(
      book: book,
      borrower: borrower,
      borrowed_date: Date.today,
      due_date: Date.today + 14.days
    )
    
    book.reload
    assert_not book.available?, "Book should be marked as unavailable when borrowed"
  end
  
  test "on_loan? returns true when book is on loan" do
    book = Book.create(title: "Loaned Book", author: "Test Author", isbn: "9876543210")
    borrower = Borrower.create(name: "Test Borrower")
    
    Loan.create(
      book: book,
      borrower: borrower,
      borrowed_date: Date.today,
      due_date: Date.today + 14.days
    )
    
    assert book.on_loan?, "Book should be recognized as on loan"
  end
end
