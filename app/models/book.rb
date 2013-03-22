require "rexml/document" # addresses https://bugs.ruby-lang.org/issues/7961#change-37017

class Book < ActiveRecord::Base
  has_many :book_formats
  has_many :formats, :through => :book_formats

  attr_accessible :author, :read, :title, :ISBN, :format_ids

  validates :title, :ISBN, :presence => true
  validates_uniqueness_of :ISBN
  validates_length_of :ISBN, :within => 10..13

  def lookup!              
    self.title = amazon_book_using_isbn.title if self.ISBN  
    self.ISBN = amazon_book_using_title.asin if self.title && !self.ISBN     
  end

private

  def client
    ASIN::Client.instance
  end
  
  def amazon_book_using_isbn
    client.lookup(self.ISBN).first
  end

  def amazon_book_using_title
    client.search_keywords(self.title).first
  end

end
