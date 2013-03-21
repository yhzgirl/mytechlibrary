class Book < ActiveRecord::Base
  has_many :book_formats
  has_many :formats, :through => :book_formats

  attr_accessible :author, :format, :read, :title, :ISBN, :book_id

  validates :title, :ISBN, :presence => true
  validates_uniqueness_of :ISBN
  validates_length_of :ISBN, :within => 10..13

  

end
