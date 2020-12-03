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

