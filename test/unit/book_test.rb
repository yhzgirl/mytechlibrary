# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ISBN       :string(255)
#

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

  test "title can be looked up on amazon using isbn" do    
    book = BookFactory.book(:ISBN => '0596515774')
    assert_equal "Book 0596515774", book.title
    book.lookup! # fetches the data from amazon and saves it to the db
    # book.reload # reloads the information from the db
    assert_equal "Head First Rails: A Learner's Companion to Ruby on Rails", book.title
  end

  test "asin can be looked up by title" do
    book = Book.new(:title => "Head First Rails: A Learner's Companion to Ruby on Rails")
    book.lookup!
    assert_equal '0596515774', book.ISBN
  end


  # test "cannot save a book that has an ISBN of an existing book ISBN" do
  #   book = BookFactory.book_with_same_isbn
    # books<<book
    # assert_equal 1, books.length
    # book2 = BookFactory.book_with_same_isbn
    # books<<book2
    # assert_equal 1, books.length
  # end
end
