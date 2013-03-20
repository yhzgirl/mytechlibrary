class Book < ActiveRecord::Base
  attr_accessible :author, :format, :read, :title, :ISBN

  validates :title, :ISBN, :presence => true
  validates_uniqueness_of :ISBN
  validates_length_of :ISBN, :within => 10..13

end
