puts "Creating books..."
books = [
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    isbn: "9780061120084",
    publisher: "HarperCollins",
    publication_year: 1960,
    description: "A novel about racial injustice and moral growth in the American South.",
    available: true
  },
  {
    title: "1984",
    author: "George Orwell",
    isbn: "9780451524935",
    publisher: "Signet Classics",
    publication_year: 1949,
    description: "A dystopian novel set in a totalitarian society.",
    available: true
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    isbn: "9780743273565",
    publisher: "Scribner",
    publication_year: 1925,
    description: "A novel about the American Dream during the Roaring Twenties.",
    available: true
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    isbn: "9780141439518",
    publisher: "Penguin Classics",
    publication_year: 1813,
    description: "A romantic novel of manners set in early 19th-century England.",
    available: true
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    isbn: "9780547928227",
    publisher: "Houghton Mifflin Harcourt",
    publication_year: 1937,
    description: "A fantasy novel about the adventures of hobbit Bilbo Baggins.",
    available: true
  }
]

created_books = books.map { |book_data| Book.create!(book_data) }
puts "Created #{created_books.size} books"

puts "Creating borrowers..."
borrowers = [
  {
    name: "John Smith",
    email: "john.smith@example.com",
    phone: "555-123-4567"
  },
  {
    name: "Jane Doe",
    email: "jane.doe@example.com",
    phone: "555-987-6543"
  },
  {
    name: "Alice Johnson",
    email: "alice.johnson@example.com",
    phone: "555-456-7890"
  }
]

created_borrowers = borrowers.map { |borrower_data| Borrower.create!(borrower_data) }
puts "Created #{created_borrowers.size} borrowers"

puts "Creating loans..."
loans = [
  {
    book: created_books[0],
    borrower: created_borrowers[0],
    borrowed_date: Date.today - 30.days,
    due_date: Date.today - 16.days,
    returned_date: Date.today - 18.days
  },
  {
    book: created_books[1],
    borrower: created_borrowers[1],
    borrowed_date: Date.today - 15.days,
    due_date: Date.today - 1.day,
    returned_date: nil
  },
  {
    book: created_books[2],
    borrower: created_borrowers[0],
    borrowed_date: Date.today - 7.days,
    due_date: Date.today + 7.days,
    returned_date: nil
  }
]

created_loans = loans.map { |loan_data| Loan.create!(loan_data) }
puts "Created #{created_loans.size} loans"

created_books.each do |book|
  book.update_availability
end
puts "Updated book availability"

puts "Seed data creation complete!"