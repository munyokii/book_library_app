class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :publication_year
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
