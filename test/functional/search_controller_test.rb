require 'test_helper'
require 'factories/book_factory'

class SearchControllerTest < ActionController::TestCase

  test "should find a book by title" do
    book = BookFactory.book({:title => "Ruby on Rails"})
    get :search_on_title, {:term => "Ruby"}
    titles = JSON.parse(@response.body)
    assert titles.include?(book.title)
  end

end