class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.date :borrowed_date
      t.date :due_date
      t.date :returned_date

      t.timestamps
    end
  end
end
