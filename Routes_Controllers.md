##### API / Routes / Controllers

API - Application Programming Interface
Published set of rules on how a program (ex: website) works
  Ex: Ruby object's API are their public methods

# Webservice/Website
Website/Webservice receives an HTTP request
  Website returns assests to be rendered by browser (ex: HTML/CSS/JS/Images)
  Webservice returns raw data

Why raw data? 
Client could have a client side program that can render raw data
  Ex: phone renders google maps on its phone, doesnt receive images from google server, only data


## Request / Response
Client - Requests info from Server
Server - Responds with info to Client

+ Requests
  - Methods (GET, PUT, PATCH, POST)
  - Path (../user/4)
  - Query String (../?loc=SF&name=) 
    - anything after the `?` is query string
    - key value pairs separated by `=` => `key = value`
      kv pairs separated by `&`
  - Body ---- also keyvalue pairs, usually comes from form
    {email: abc@abc.com, password: 1234, age: 20}
    - Methods do not go here

+ Response
  - Status codes (200 OK / 404 Not Found )
  - body (contains request contents)
    - can be a lists, HTML/CSS/JS content. All depends on request


## What happens in Rails Server?

+ Router receives request. Figures out where request goes to
  - Requests contains 2 things:
    1. Path ------  `../users`
    2. Method ----  `GET`

Router has a list of Path/Method combos assigned to a Controller / Actions
^ Assignments are created in the Rail's project `config/routes.rb` file

After receiving requets, checks for Path existence then finds Action (Method)
If Path or Action does not exist
  - Sends a `No existence error` (Error will specify the type of error)

1. Checks Routes (Path)
2. Initializes a Controller
3. Calls the assigned/correct Action (Method)

# Routes

# Controllers 
- Controls one resource (ex: UsersController)
- Contains Actions
- Must Render or Redirect a response
  - Cannot be both!

Render - places something in response body
Redirect - sends response to requester starting a new cycle/request to diff URL

*************************************
*************************************
*************************************

## Callbacks
  - added into Model's associations or validations

# Relational Callbacks
  Blog example:
    - When user is destroyed, their posts should be destroyed as well
      Otherwise, posts will be "widowed"
    - Pass in `dependent:` to `has_many` to destroy simultaneously
  Other less used options:
    - `dependent: :nullify` --- sets foregin key to NULL
    - `dependent: :restrict` -- exceptions will raise if associated objects exist
/                               must manually destroy associated objects    
  To prevent further issues from bogus foreign keys or Delete through SQL
    - DB Constraints should be added to guarantee `referential integrity`

--------
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  belongs_to :user
end

>> user = User.first
=> #<User id: 1>
>> user.posts.create!
=> #<Post id: 1, user_id: 1>
>> user.destroy
=> #<User id: 1>
--------

# Callback Registration
 - allows methods to register as "callbacks" and used with other Model lifecycle events

class User < ApplicationRecord
  validates :random_code, presence: true
  before_validation :ensure_random_code

  protected
  def ensure_random_code
    # assign a random code
    self.random_code ||= SecureRandom.hex(8)
  end
end

^ `before_validation` callback uses the protected method to create a validation
Ensures a `random_code` is specified, regardless if user provided one
** GP: Keep callback methods private or protected

# Common callbacks
  - `before_validation` -- last chance to set forgotten fields
  - `after_create` ------- post-create logic like send confirmation email
  - `after_destroy` ------ post-destroy cleanup logic

Callbacks can be modified for specific ops only
Ex: 
class CreditCard < ApplicationRecord
  # Strip everything but digits, so the user can specify "555 234 34" or
  # "5552-3434" or both will mean "55523434"
  before_validation(on: :create) do
    self.number = number.gsub(/[^0-9]/, '') if attribute_present?('number')
  end
end

## DNS - Domain Name Service
Translates domain names to IP address
EG: www.google.com = 8.8.8.8 /// www.example.com = 93.184.216.119

+ DNS structure
  - consists of "labels" separated by dots
    - www.example.com 'www' 'example' 'com'
      - hierarchy goes from righ to left
      - 'example' is a subdomain of 'com'

+ DNS is a Distributed Directory Service
No one central databse to hold domain names and IP's

Several "Authoritative Name Servers" hold a domain name
Name server counterparts are "DNS resolvers" (looks up info)
ALl OS's and ISPs' hold DNS resolvers

Query path
DNS Resolver --> DNS Name Server
  If query is found, return result
  If not found:
    - DNS Name Server "becomes" Resolver and checks its partner name server (Recursive)
    OR 
    - Returns a different, possibly better, Name Server back to Resolver and Resolver starts again (Iterative)


# Cache Poisoning
  An attacker repalced valid cache entries with corrupted data.
  Redirects IP address to a fake site to collect info or infect computer 

*************************************
*************************************
*************************************

### JSON API

Broswers can make HTTP requests to a Webserver via:
  - GET rqst via <a> tag
  - POST verb when submitting HTML form

Nonbrowser clients can also make HTTP requests
- requestor prefers raw data over HTML

# JSON & Rails
To build a Rails API, will need Controllers to convert:
  1. Model objects into JSON
  2. Render JSON

Wizard.first = first object in ActiveRecord form
Wizard.first.to_json = converts object to JSON string

$ rails console
> Wizard.first
=> #<Wizard id: 1, fname: "Harry", lname: "Potter", house_id: 1,
school_id: 1, created_at: "2013-06-04 00:31:04",
updated_at: "2013-06-04 00:31:04">

> Wizard.first.to_json
=> "{\"created_at\":\"2013-06-04T00:31:04Z\",\"fname\":\"Harry\",
\"house_id\":1,\"id\":1,\"lname\":\"Potter\",
\"school_id\":1,\"updated_at\":\"2013-06-04T00:31:04Z\"}"

Usually when rednering, an `HTML Template` will be specified (View)

class UsersController < ApplicationController
  def index
    users = User.all
    render json: users <----- returns a json string
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
end

### ROUTING
Routers recognize URLs and chooses controller method to dispatch its processing
Ex: GET /patients/17 means PatientsController#Show
How?
  - GET is the Method/Verb, 
  - `.../patients/17` specifies a Wildcard (patient #)
  - those 2 combined = PatientsController#Show

------------------------------

# Nested Routes

Examples models
# app/models/magazine.rb
class Magazine < ApplicationRecord
  has_many :articles
end

# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :magazine
end


Example routers
# config/routes.rb
NewspapersApp::Application.routes.draw do
  resources :magazines do
    # provides a route to get all the articles for a given magazine.
    resources :articles, only: :index
  end

  # provides all seven typical routes
  resources :articles
end

nested article in magazines generates `magazines/:magainze_id/articles`
Requestes will be sent to ArticlesController#index

#  app/controllers/ArticlesController

class ArticlesController
  def index
    if params.has_key?(:magazine_id)
      # index of nested resource
      @articles = Article.where(magazine_id: params[:magazine_id])
    else
      # index of top-level resource
      @articles = Article.all
    end

    render json: @articles
  end
end

Nested resource contains a dynamic segment parameter for magainze_id

## Restricting Member Routes

# Member routes
show: GET /magazines/:magazine_id/articles/:id
edit: GET /magazines/:magazine_id/articles/:id/edit
update: PUT /magazines/:magazine_id/articles/:id
update: PATCH /magazines/:magazine_id/articles/:id
destroy: DELETE /magazines/:magazine_id/articles/:id

+ Why restrict nested resource to `only :index`?
  If unrestricted, Member Routes (anything with url/:id) will be a duplicate 
  of `resources :articles`

** There should only be oneURL that maps to a respresentation of a resource
Eg: 
  - `/articles/101` same as `/magazines/42/articles/101`



***
resources :magazines do
  # provides a route to get all the articles for a given magazine.
  resources :articles, only: :index
end
***

## Restricting Collection Routes
# Collection Routes:
index: GET /magazines/:magazine_id/articles
new: GET /magazines/:magazine_id/articles/new
create: POST /magazines/:magazine_id/articles

`..only: :index` is ok as it will retreive all articles of a given magazine
--> index: GET /magazines/:magazine_id/articles

## Adding Non-default Routes
# Adding Member routes
  'member' block should be added into Router's resources
  HTTP verb is added to the added Action

resources :photos do
  member do
    get 'preview'
  end
end

`get 'preview'`
Gets request for `photos/id#/preview`, 
then routes a preview action of PhotosController

# Adding Collection Routes
  'colleciton' blo0ck added inside resources

resources :photos do
  collection do
    get 'search'
  end
end
`get 'search'` 
GETs a path for `/photos/search`, Action of 'search' added to PhotosController
Also creates a `search_photos_url` helper



