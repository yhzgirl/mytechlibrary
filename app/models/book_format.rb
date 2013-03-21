class BookFormat < ActiveRecord::Base
  attr_accessible :book_id, :format_id

  belongs_to :book
  belongs_to :format

end
