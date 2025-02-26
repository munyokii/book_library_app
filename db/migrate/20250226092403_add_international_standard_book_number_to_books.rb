class AddInternationalStandardBookNumberToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :isbn, :string
  end
end
