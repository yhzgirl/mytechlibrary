# == Schema Information
#
# Table name: formats
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Format < ActiveRecord::Base
  attr_accessible :category, :book_ids

  has_many :book_formats
  has_many :books, :through => :book_formats  
end
