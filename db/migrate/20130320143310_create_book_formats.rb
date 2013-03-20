class CreateBookFormats < ActiveRecord::Migration
  def change
    create_table :book_formats do |t|
      t.integer :book_id
      t.integer :format_id

      t.timestamps
    end
  end
end
