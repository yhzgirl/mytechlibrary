class Format < ActiveRecord::Base
  # has_many :book_formats
  # has_many :books, :through => book_formats

  attr_accessible :type
end
