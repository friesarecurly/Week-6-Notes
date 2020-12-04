Rails Views

View files go into the model's view folder then 
Match view file to follow after the controller's action 
Eg: Books model
`views/books/index.html.erb`

.erb = embedded ruby code

Inside BooksController
def index
  books = Books.all
  render :index OR 'index' --- loads /index.html.erb
end

render will print out whatever is inside /index.html.erb
`index.html.erb`
contains /   <h1>All the books</h1>
then when Books#index is called, <h1>All the books</h1> will show

Any instance variables inside each Action can be called
`BooksController`
def index
  @books = Books.all
  render :index OR 'index' 
end
`index.html.erb`
<ul>
<% @books.each do |book| %>
<li> <%= book.title %></li> ------this will render every book in 
<% end %>
</ul>

<% ruby code that will not be printed, ruby actions can be performed in here %>
<%= ruby code that will render>
commenting out in HTML <!--- --->
if <% %> <%= %> is inside HTML <!--- ---> then <%# %> <%#= %>ruby # to comment out is needed

Any views files inherit from `views/layouts/application.html.erb`
Inside are HTML tags, which affect all view pages
<%= yield %> ==> view html files = yield 

class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def show
    @book = Book.find_by(id: params[:id])
    
    if @book
      render :show
    else
      #return user to index page
      redirect_to '/books' OR books_url
    end
  end

end

only 1 render or redirect_to allowed per method
double render not allowed unless returned out before 2nd render/redirect is hit


`Template is missing` 
Controller#Action found, but either missing:
- render content in Controller file
- missing `Action.html.erb` file

When creating a form inside views file

# action: url we want to send data
# method: http method that we want to use

<form action="/books" method="post">  <--"post" is the HTML method/verb
  <label for="title">Title</label>
  <input id="title" type="text" name="title"> <--- name="title" / title becomes key value in parameter. Check in Rails server in terminal

  <input type="submit" value="Add book to library">
</form>

Title submitted becomes {"title"=>"Harry Potter"...} inside of the params
<label for="title">Title</label>
<input id="title" type="text" name="book[title]">

<label for="author">Author</label>
<input id="author" type="text" name="book[author]">

<label for="year">Year</label>
<input id="year" type="text" name="book[year]">

^ Each creates a text box
If 'Harry Potter' "JK Rowling" "2002" inputed
Params become {"book"=> {title => "Harry Potter", author=>"JK Rowling", year=>"2002}}

<label for="category">Category</label>
<select id="category" name="book[category]">
  <option disabled selected> ---Please select--- </option>
  <option value="Fiction">Fiction</option> value becomes value of book[category] key
  <option value="Non-fiction">Non-fiction</option>
  <option value="Sci-Fi">Sci-Fi</option>
</select>

<label for="description"> Description </label>
<textarea name="book[description]" rows="8" cols="40"> </textarea>
<input type="submit" value="Add book to Library">

Submit button packages all info and POST requests to Action path
Sends it all to controller
`name=` --- param's key
`value=` -- param's value


def create
  @book = Book.new(book_params)

  if @book.save
    redirect_to book_url(@book) <--directs to book's page
  else
    render :new <--sends back to new book form page
  end
end

private
def book_params
  params.require(:book).permit(:title, :author, :year, :description, :category)
end