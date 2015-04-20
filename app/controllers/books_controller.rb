class BooksController < ApplicationController
  skip_before_filter :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    if user_signed_in?
      # Checks to see if book is already in current_user's favorites list.
      @book_list = current_book_list
      current_item = @book_list.line_items.find_by_book_id(@book.id)

      if current_item.present?
        @line_item = current_item
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    if current_user.try(:admin?)
      @book = Book.find(params[:id])
    else
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book,
          :notice => 'Book was successfully created.' }
        format.json { render :json => @book,
          :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book,
          :notice => 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
end
