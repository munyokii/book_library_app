# Book Lending Library

A simple Ruby on Rails application for managing a book lending library. This application allows users to manage books and track lending history without requiring authentication.

## Features

- **Book Management**: Create, view, update, and delete books with details like title, author, ISBN, publisher, and publication year
- **Borrower Management**: Track who borrows books with borrower profiles
- **Lending System**: Record when books are borrowed and returned
- **Borrowing History**: View the complete lending history for each book and borrower
- **Validation**: Ensure data integrity with model validations

## Technologies

- Ruby 3.2.2
- Rails 8.0.0
- PostgreSQL
- Bootstrap 5
- RSpec for testing

## Setup and Installation

### Prerequisites

- Ruby 3.2.2 or higher
- Rails 8.0.0
- SQLite3

### Installation Steps

1. Clone the repository:
   git clone <https://github.com/MuliJob/book_library_app.git>
   cd book-lending-library

2. Install dependencies:
   bundle install

3. Set up the database:
   rails db:create
   rails db:migrate
   rails db:seed

4. Start the server:
   rails server

5. Open your browser and navigate to:
   <http://localhost:3000>

## Database Structure

The application has the following models:

- **Book**: Stores book information (title, author, ISBN, etc.)
- **Borrower**: Records information about people who borrow books
- **Loan**: Tracks the lending history (book, borrower, borrow date, due date, return date)

## Usage Guide

### Managing Books

- **View All Books**: Navigate to the homepage to see all books
- **Add New Book**: Click "Add New Book" and fill out the form
- **View Book Details**: Click on view details button to see its details and borrowing history
- **Edit Book**: On the book details page, click "Edit Book"
- **Delete Book**: Click the delete button to delete a book

### Borrowing System

- **Borrow a Book**: On a book's details page, click "Borrow this Book" and enter borrower information
- **Return a Book**: For borrowed books, click "Return Book" on the book details page
- **View Borrowing History**: Book details pages show complete borrowing history

### Borrower Management

- **View All Borrowers**: Click "Borrowers" in the navigation menu
- **View Borrower Details**: Click on a borrower's view history to see their borrowing history
- **Create Borrower**: Borrowers are automatically created when a book is borrowed for the first time

## Testing

The application includes both model and controller test.

To run the tests:
rails test

### Test Coverage

- **Model Tests**: Validates associations, validations, and custom methods
- **Controller Tests**: Ensures actions respond appropriately

## Implementation Details

### Models

- **Book**: Contains validation for presence of title and author
- **Borrower**: Validates presence of name and format of email (if provided)
- **Loan**: Validates associations and date logic

### Key Features Implementation

- **Book Availability**: Books track their loan status using the `available?` method
- **Due Date Management**: Loans have due dates and can be flagged as overdue
- **Borrower Creation**: New borrowers can be created on-the-fly during checkout
- **Return Management**: Books can be returned, updating loan records appropriately

## Deployment

For production deployment:

1. Update your database configuration in `config/database.yml`
2. Set up environment variables for sensitive information
3. Precompile assets:
   RAILS_ENV=production rails assets:precompile
4. Run with a production server like Puma or Passenger

## Contributing

1. Fork the repository
2. Create your feature branch: `git switch -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
