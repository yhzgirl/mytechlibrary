class BookFormat < ActiveRecord::Base
  attr_accessible :book_id, :format_id

  belongs_to :book
  belongs_to :format

  attr_accessor :include
  after_find :set_include

  private

    def set_included
        self.included = "1"
    end

end

# example:
# http://tech.thereq.com/post/12671192370/rails3-forms-for-has-many-through-and-nested-models