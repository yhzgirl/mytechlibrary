class SearchController < ApplicationController

  def search_on_title
    # search_on_title is a method on the model to do a wildcard search on keyword
    books = Book.search(params[:term])
    render json: books.map(&:title)
  end

end