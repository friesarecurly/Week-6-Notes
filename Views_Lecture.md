Views Lecture

Params - built in rails method to call inside controller
Stateless HTTP  - Instances of controller only exist as long as the req/res cycle


Model - ActiveRecord 
Controller interacts with router and browser(client)

1. Client sends request (/users{params})
2. Router filers rqst (users#index{params})
3. Controller executes index method to Model (User.all)
4. Model retreives data from DB and sesnds results to Controller ([users])
5. Controller takes users list and sends to View (@users)
6. Views uses @users and sends HTML back to Controller (index.html.erb)
7. Controller send info and renders/redirects to Client

# Views
- Presentational part of our app
- Controller uses Views to format response back to client
* Conventions


# ERB Tags
- allows us to use ruby in HTML in Views

Prefix  Verb    URI Pattern   Controller#Action
post    GET     /posts/:id    posts#show

post_url(post) <--- Prefix_url(:id)

URL helper defaults to GET methods
Only way to call other methods is to nest it inside a hidden method

## Forms
+ HTML form has:
  - 1) Action & Method (path and verb)
  - 2) Input fields
  - 3) Submit

new.html.erb
<h1>Make a new post!</h1>

# generates request that hits PostsController#create
<form action="<%= posts_url%>" method="POST">
  <label for="post_body">Body: </label>
      // for= specifies this label is for "post_body"
      // Body: is visually seen in HTML page
    <input id="post_body" type="text" name="post[body]" > 
      // id= used to connect `label for=`
      // type= is type of input
      // name= most hold top lvl key for safety(check private post_params method)

  <label for="author_id">Author Id: </label>
    <input type="author_id" name="post[author_id]" >

  <input type="submit" value="Make Post">
      // value= shows text inside submit button
</form>

`/posts_controller.rb`
def create
  post = Post.new(post_params)
  if post.save
    render json: post
  else
    render json: post.errors.full_messages, status: 422
  end
end

### Editing Posts 
def edit
  @post = Post.find(params[:id]) 
    // need @post to use it in View page
  render :edit
end


`edit.html.erb`
<h1>Edit a post!</h1>

<form action= "<%= post_url(@post) %>" method="POST">
    // method="post" must be used b.c form elements only accepts GET or POST
    // to edit, POST must be used, GET cannot be used to update info
  <input type="hidden" name="_method" value="PATCH">
    // ^overrides form methods with name"_method"

  <label for="post_body">Body: </label>
    <input id="post_body" type="text" name="post[body]" > 

  <label for="author_id">Author Id: </label>
    <input type="author_id" name="post[author_id]" >

  <input type="submit" value="Update Post">
</form>

When View pages have a lot of the same code (not DRY), use Partials
# Partials
- helps make code DRY

`new.html.erb`
<%= render "form", edit: false, post: @post%>

`edit.html.erb`
<%= render "form", edit: true, post: @post%>

`_form.html.erb`
<% if edit %> 
    // edit comes from new or edit View files
  <% action = post_url(post) %>
  <% button_text = post_url(book)%>
<% else %>
  <% action= posts_url %>
  <% button_text = posts_url %>
<% end %>

<form action="<%= action%>" method="POST">
  <%if edit%>
    <input type ="hidden" name="_method" value="PATCH">
  <% end %>

  <label for="post_body">Body: </label>
    <input id="post_body" type="text" name="post.body" > 
          // can use 'post.body' instead of @post.body because @post is defined in Controller

  <label for="author_id">Author Id: </label>
    <input type="author_id" name="post.author_id">

  <input type="submit" value="<%= button_text%>">
</form>

