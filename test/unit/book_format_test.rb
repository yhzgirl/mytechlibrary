require 'test_helper'

class BookFormatTest < ActiveSupport::TestCase
  test "the book and format can be saved to the joiner table" do
    book = Book.create
    book2 = Book.create
    pdf = Format.create
    ebook = Format.create
    assert_equal 0, book.formats.count
    assert_equal 0, book2.formats.count
    assert_equal 0, pdf.books.count
    assert_equal 0, ebook.books.count
    book.formats<<pdf
    assert_equal 1, book.formats.count
    book2.formats<<pdf
    assert_equal 1, book2.formats.count
    ebook.books<<book2    
    assert_equal 2, pdf.books.count
    assert_equal 1, ebook.books.count
    assert_equal 2, book2.formats.count
  end
end
