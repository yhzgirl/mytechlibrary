class BooksController < ApplicationController
  before_filter :authenticate, :except => :index
  
  #GET
  def index
    @books = Book.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  #GET
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  #GET
  def new
    @book = Book.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book }
    end
  end

  #POST
  def create
    @book = Book.new(params[:book])
    @book.lookup!
    respond_to do |format|
    if @book.save #why does this not work with a !
      flash[:notice] = "The book has been saved"        
      format.html { redirect_to @book, notice: "The book has been saved" }
      format.json { render json: @book, status: :created, location: @book }
    else
      #redirect_to(@book)
      format.html { render action: "new" }
      format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  #GET
  def edit
    @book = Book.find(params[:id])
  end

  #PUT
  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = "The book has been updated"
        # redirect_to book_path(@book)
        format.html { redirect_to @book, notice: "The book has been updated" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  # redirect_to book_path(@book)

  #DELETE
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "The book has been deleted"
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
    #redirect_to books_path
  end

end
