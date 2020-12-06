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

# <% ruby code that will not be printed, ruby actions can be performed in here %>
^ `pe + tab` shortcuts <% %>
# <%= ruby code that will render>
^ `er + tab` shortcuts <%= %>
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

Book params need to be added as Rails doesn't allow params to be added directly in 
 `@book = Book.new(params[:book]` <-- not allowed 
 `@book = Book.new(book_params)` <-- allowed

# Put vs Patch
Put updates the whole record
Patch updates parts of a record

## To use a edit Action, create `edit.html.erb` for `render :edit`

def edit
  @book = Book.find_by(id: params[:id]) <-- will notify edit.html.erb what book instance to edit
  render :edit
end


<form action="<% book_url(@book) %>" method="post">  <--cannot use patch in method, only "get" or "post" is allowed
  <input type="hidden" name="_method" value="PATCH"> 
/     # hidden field not exposed to user
/     # name="_method" -- tells rails, this is the actual method, not the one in <form>
/     # value -- becomes actual method/HTML verb

  <label for="title">Title</label>
  <input id="title" type="text" name="title" value="<%= @book.title %>"> <-- value will show the @book.title in text area

@book.key needs to be value assigned in each input area to show what the books current value is    
...
<label for="category">Category</label>
<select id="category" name="book[category]">
  <option disabled> ---Please select--- </option>
  <option value="Fiction" <%= @book.category == "Fiction" ? "selected" : "" %> > Fiction</option> 
  <option value="Non-fiction" <%= @book.category == "Non-fiction" ? "selected" : "" %>>Non-fiction</option>
  <option value="Sci-Fi" <%= @book.category == "Sci-Fi" ? "selected" : "" %>>Sci-Fi</option>
  #Ternary allows category to become "selected" or not 
</select>



  <input type="submit" value="Update book">
</form>


## Partials
Partials - saves HTML code shared amongst view files 
`_form.html.erb`
+ Things to change to be dynamic
  - Action
  - Hidden input patch
  - prefilled values
  - Submit button value

To call partials file
<%= render 'form', book: @book, action: :edit %>
^ rails understands 'form' as _form.html.erb

To make Action dynamic,
<% if action == :edit %>
<%  action_url = book_url(book) %>
<% else %>
<%  action_url = books_url %>
<% end %>
^ action_url goes below

<form action="<%= action_url %>" method="post">
  <% if action == :edit %>
  <input type="hidden" name="_method" value="PATCH">
  <% end %>

