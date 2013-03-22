class Format < ActiveRecord::Base
  attr_accessible :category, :book_ids

  has_many :book_formats
  has_many :books, :through => :book_formats  
end
