require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the book_id and format_id can be saved to the joiner table" do
    book = Book.create
    book2 = Book.create
    pdf = Format.create
    ebook = Format.create
    assert_equal 0, book.formats.count
    assert_equal 0, book2.formats.count
    assert_equal 0, pdf.books.count
    assert_equal 0, ebook.books.count
    book << ebook 
    # assert_equal 1, book.formats.count
    # assert_equal 1, book.formats.count
    # pdf(book2)
    # assert_equal 1, pdf.books.count
    # assert_equal 1, pdf.books.count
  end
end
