class AddPdfAndEBookAndSoftcoverAndHardcoverToBook < ActiveRecord::Migration
  def change
    add_column :books, :PDF, :boolean
    add_column :books, :eBook, :boolean
    add_column :books, :softcover, :boolean
    add_column :books, :hardcover, :boolean
  end
end
