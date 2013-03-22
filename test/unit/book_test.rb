require 'test_helper'
require 'factories/book_factory'

class BookTest < ActiveSupport::TestCase
  test "create book works" do
   gwtw = Book.new
   gwtw.save
   assert_kind_of Book, gwtw
   end 

   test "validation of ISBN presence" do
     book =  BookFactory.random_book
     book.save
     assert_not_nil book.ISBN 
   end

   test "cannot save a book without isbn" do
    book = BookFactory.book_without_isbn
    refute book.valid?
    book.ISBN = '1234567890'
    assert book.valid?
   end

   test "cannot save a book without title" do
    book = BookFactory.book_without_title
    refute book.valid?
    book.title = "test book"
    assert book.valid?
  end

  # test "cannot save a book that has an ISBN of an existing book ISBN" do
  #   book = BookFactory.book_with_same_isbn
    # books<<book
    # assert_equal 1, books.length
    # book2 = BookFactory.book_with_same_isbn
    # books<<book2
    # assert_equal 1, books.length
  end
end
