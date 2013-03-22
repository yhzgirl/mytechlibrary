class BookFactory

  def self.book(params = {})
    params[:ISBN] ||= "1234567890"
    params[:title] ||= "Book #{params[:ISBN]}"
    Book.create!(params)
  end

  def self.random_book
    isbn = Array.new(10) { rand(10) }.join
    title = "Book #{isbn}"
    Book.create!(:title => title, :ISBN => isbn)
  end

  def self.book_without_isbn
    Book.new(:title => "book without isbn")
  end

  def self.book_without_title
    Book.new(:ISBN => '1234567890')
  end

  def self.book_with_same_isbn
    isbn = '1234567890'
    Book.new(:title => 'book', :ISBN => isbn)
  end
end