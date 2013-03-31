# == Schema Information
#
# Table name: book_formats
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  format_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookFormat < ActiveRecord::Base
  attr_accessible :book_id, :format_id
  
  belongs_to :book
  belongs_to :format
end
