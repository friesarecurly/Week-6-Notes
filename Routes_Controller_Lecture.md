##### MVC Overview

1. Client sends request to Website/Webservice
 - Our comp (client) sends a HTTP request to server (GET www.google.com page)
 - Server handles request and formulates an appropriate response
 - HTTP response is sent back to client

# API - Application Programming Interface
Web API, generally sends back data, not views

# REST API - Representational State Transfer
- standardized way to interpret an HTTP request and extrapolate the desired response form server

# HTTP requests
1. Method (HTTP Verb)(eg: GET, POST) - describes action to perform
2. Path (eg: /users) - a string that specifies the resource requested
3. Query String (eg: ?loc=new+york; optional) - may further specify resource requested
4. Body (eg: username=janedoe; optional) - additional data from the client

# Path & Query are part of URL
Path - path relative to domain
URL = `www.google.com/search?query=dogs`
Path = `/search`
Query = `?query=dogs`

GET - Gets from DB
POST - inserts into DB
PATCH/PUT - Change in DB
DELETE - Removes from DB

# HTTP Response
1. Status (Eg: 200, 302, 404)
  - indicates type of response (whether successful or not)
2. Body (Eg: Actual HTML doc or data formatted as JSON)
  - The actual data/content the server responded with

Notes: 
+ JSON - Javascript Object Notation
+ Add to top portion of Gemfile
  - gem `better_errors` # formats errors
  - gem `binding_of_caller` # gives a repl to debug errors

# Router
1. Receives request 
2. Processes it based on Verb and Path
3. Determines Controller and Action
4. Controller generates Response to router
5. Sends respones back to Client

** Routes lives in `config/routes.rb` **

Ex: `/routes.rb`
/      Rails.application.routes.draw do
/        get "/posts", to: "posts#index"
/      end

` bundle exec rails routes ` - generates routes list
` bundle exec rails routes -c posts` - generates routes specifically for console (-c) and controller (posts)
` bundle exec rails server` or `rails s`- starts up rails server
` lsof -i :3000` - checks activity on port 3000
` kill -9 PID#` kills PID # port

RESTful Route - standard ones below
/     Rails.application.routes.draw do
/       get "/posts", to: "posts#index" ---- route
/       get "/posts/:id", to: "posts#show" --another route ':id is a "wildcard"'
/       post "/posts", to: "posts#create"
/       patch "/posts/:id", to: "posts#update"
/       put "/posts/:id", to: "posts#update"
/       delete "/posts/:id", to: "posts#destroy"
/       OR
/       resources :posts <--does all the above in 1 shot
/     end

All the lines above are a Route that can be taken

`resources :users` - generates 7 standard RESTful routes
- Can add `only` or `except` optino to include/exclude certain actions
`resources :users, only: [:create, :destroy]`
`resources :users, except: [:new, :edit]`
Customs route
`get '/users', to: 'users#index'`


## Contorllers are made in `app/controllers` folder
Naming convention - 
  - File name: `posts_controller.rb` ------ plural of model, snake case
  - Class name: `class PostsController` --- plural of model, CamelCase

Ex: `/controlers`
/     Class PostsController < ApplicationController -- inherits from ApplicationController
/       def index
/         posts = Post.all -------  grabs all posts into Post model
/         render json: posts -----  generates json version of posts
/       end
/     end


## Params
3 ways to pass params in an HTTP
1. wildcards (/posts/:id)
2. query string (/path?param1=value1&param2=value2)
3. request body (built in using a form, bunch of key value pairs)
  - do not use for GET requests

class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end
  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params) #returns key/value pairs permitted
    if post.save #NOT post.save!
      render json: post
    else
      render json: post.errors.full_messages, status: 422 
        # returns error's full message
        # 422 "unprocessable entity"
    end
  end

  def destroy
    post = Post.find(params[:id]) 
      # ActiveRecord object returned
    post.destroy 
      #.destroy a method of ActiveRecord
    redirect_to "/posts" 
      #not necessary, but returns /posts for user to see
    OR redirect_to posts_url 
      #url helper methods only get
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params) <---ActiveRecord method
      redirect_to post_url(post) <---same as post_url(post.id)
    else
      render json: post.error.full_messages, status: 422
    end
  end


  private
  def post_params
    # require(:top_level_key)
    # permit(:nested, :keys, :we, :permit)
    params.require(:post).permit(:body, :author_id)
  end
end

top_level_key made up in out params.require()
In Postman, top_level_key should be added in body's key
post[body] or post[author_id]
