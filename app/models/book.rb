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

require "rexml/document" # addresses https://bugs.ruby-lang.org/issues/7961#change-37017


class Book < ActiveRecord::Base
  has_many :book_formats
  has_many :formats, :through => :book_formats

  attr_accessible :author, :read, :title, :ISBN, :format_ids

  validates :title, :ISBN, :presence => true
  validates_uniqueness_of :ISBN
  validates_length_of :ISBN, :within => 10..13

  def lookup!
    self.title = amazon_book_using_isbn.first.title if self.ISBN?
    self.ISBN = amazon_book_using_title.first.asin if self.title? && !self.ISBN?   
  end

  def self.search(title)
    if title
      find(:all, :conditions => ['title ILIKE ?', "%#{title}%"])
    else
      find(:all)
    end
  end

private

  def client
    ASIN::Client.instance
  end
  
  def amazon_book_using_isbn
    book = client.lookup(self.ISBN)
  end

  def amazon_book_using_title
    client.search_keywords(self.title)
  end

end
