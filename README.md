# M-Woodworks BackEnd API for React App

## Build References

Authentication

- https://www.bluebash.co/blog/rails-6-7-api-authentication-with-jwt/

Associations

- https://blog.dennisokeeffe.com/blog/2022-03-16-understanding-rails-associations
- https://medium.com/swlh/a-step-by-step-guide-to-using-the-rails-console-to-test-rails-models-associations-and-validations-986f4825aadf
- https://joshfrankel.me/blog/create-a-many-to-many-activerecord-association-in-ruby-on-rails/
- https://stevepolito.design/blog/rails-authentication-from-scratch/
- https://medium.com/@maxfpowell/a-quick-intro-to-rails-serializers-b390ced1fce7

Working with images

- https://betterprogramming.pub/how-to-upload- images-to-a-rails-api-and-get-them-back-again-b7b3e1106a13
- https://dev.to/vetswhocode/react-tutorial-upload-and-fetch-photos-with-cloudinary-2ec9
- https://hackernoon.com/image-storage-in-rails-apps-using-cloudinary-and-active-storage-9w2u3yli
- https://medium.com/@anaharris/how-to-add-image-upload-functionality-to-your-rails-app-9f7fc3f3d042
- https://www.microverse.org/blog/how-to-build-an-image-upload-feature-with-rails-and-active-storage

## Steps

Set-up

1. Create the project
   `rails new backen_m-woodworks --api --database=postgresql`

2. Add some gems

   - uncomment `gem 'bcrypt'` in the Gemfile

   - add `gem 'jwt'` for Json Web Token authentication

3. Run `bundle install` in terminal

4. Create the postgres database by running `rails db:create`

#### Build Authentication

1. Create a User Model
   `rails g model user name:string username:string email:string password_digest:string`

2. Open up our newly created User model and add some security flags as well as some validations to ensure users inpt their credentials. The User model will look like this:

   ```
   class User < ApplicationRecord
    require 'securerandom'

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
   end
   ```

3. Create the User Controller by running `rails g controller users` and then add the CRUD methods to the controller so the `users_controller.rb` looks like this:

   ```
   class UsersController < ApplicationController
     skip_before_action :authenticate_request, only: [:create]
     before_action :set_user, only: [show, :destroy]

    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end

    # GET /users/{username}
    def show
      render json: @user, status: :ok
    end

    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: {errors: @user.errors.full_messages },
              status: :unprocessable_entity
      end
    end

    # PUT /users/{username}
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    # DELETE /users/{username}
    def destroy
      @user.destroy
    end

      private
        def user_params
          params.permit(:username, :email, :password)
        end

        def set_user
          @user = User.find(params[:id])
        end
      end

   end

   ```

4. Build the JsonWebToken concerns to handle our keys. Create a file `json_web_token.rb` in the `apps/controllers/concerns` directory and add the following:

   ```
   require 'jwt'
   module JsonWebToken
     extend ActiveSupport::Concern
     SECRET_KEY = Rails.application.secret_key_base

     def jwt_encode(payload, exp = 7.days.from_now)
       payload[:exp] = exp.to_i
       JWT.encode(payload, SECRET_KEY)
     end

     def jwt_decode(token)
       decoded = JWT.decode(token, SECRET_KEY)[0]
       HashWithIndifferentAccess.new decoded
     end
   end
   ```

5. Let's build the `authenticate_request` function in our `application_controller.rb` file

   ```
   class ApplicationController < ActionController::API
    include JsonWebToken

    before_action :authenticate_request

    private
      def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
      end
   end
   ```

6. Now we need to create the authentication controller for loggin in users. Run `rails g controller authentication` in terminal

   ```
    class AuthenticationController < ApplicationController
     skip_before_action :authenticate_request

     #POST /auth/login
     def login
       @user = User.find_by_email(params[:email])
       if @user&.authenticate(params[:password])
         token = jwt_encode(user_id: @user.id)
         render json: { token: token }, status: :ok
       else
         render json: { error: 'unauthorized' }, status: :unauthorized
       end
     end
    end
   ```

7. Create your routes and add `resources` for the user as well as a POST route for logging in. Add these lines to the `routes.rb` file
   - `resources :users`
   - `post '/auth/login', to: 'authentication#login'`

### Build the Projects and Gallery Models and Controllers

1. Starting with the Project item lets build the controller, model and the database migration using the scaffold generator -- run `rails g scaffold Project project_name:string project_type:string project_tags:string description:string`

2. Run `rails db:migrate` to migrate the data into the database schema

3. Now we will build the Models and Controllers for our Gallery, but we will build them separately instead of using the `scaffold` command.

   - Build the Gallery model by running `rails g model gallery title cover_image_url alt_text`
   - Build the Gallery controller by runnig `rails g controller gallery`

4. Association -- Let's make these models work together. We want each project to have one gallery. To make the association, run `rails g migration AddReferencesToGalleries project:references` then follow that with `rails db:migrate`

5. We Didn't scaffold the gallery model so we will need to create the controller and give it the methods and actions we want: run `rails g controller gallery` in terminal and then navigate to the file.

6. Build your methods according the model given to us in the scaffolded project controlle in `app/controllers/projects_controller.rb` - You'll now have a `gallery_controller` and it should look like this:

   ```
   class GalleryController < ApplicationController
   skip_before_action :authenticate_request

   #GET /galleries
     def index
   @galleries = Gallery.all

    render json: @galleries, status: :ok
   end


   # GET /galleries/1

   def show
   render json: @gallery, status: :ok
   end


   # POST /galleries

    def create
    @gallery = Gallery.new(gallery_params)

        if @gallery.save
          render json: @gallery, status: :created,
          location: @gallery
        else
          render json: @current_user.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /galleries/1

      def update
        if @gallery.update(project_params)
          render json: @gallery
        else
          render json: @gallery.errors, status: :unprocessable_entity
        end
      end

      # DELETE /projects/1

      def destroy
        @gallery.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.

      def set_gallery
        @gallery = Gallery.find(params[:id])
      end

    # Only allow a list of trusted parameters through.
      def gallery_params
        params.fetch(:gallery, {})
      end
    end
   ```

### Test Data

1. Open up the Rails Console by running `rails c`

2. Create a Project by running `@project = Project.create((project_name: 'Test 1', project_type: 'type 1', project_tags: 'tag 1', description: 'description1')`

3. Create a gallery with an association to the Project `@author.gallery = Gallery.create(image_url: 'testurl', cover_image_url: 'testcover1', project_id: 1)`

### Add our Images Model and Controller

1. Run the generator for our model in the terminal: `rails g scaffold Images image_url:string alt_text:string`

2. Run `rails db:migrate`

3. Make the Images association with Gallery - `rails g migration AddReferencesToImages gallery:references project:references`

4. Migrate your new references: `rails db:migrate`

5. A few changes in the `images_controller.rb` are required to return an image by `id`. In the show action in the image controller change it to the following:

```
# app/controllers/images_controller.rb

def show
  @image = Image.find(params[:id])
  render json: @image, status: :ok
end
```

You should now have all your models and controllers set up

Now we need to enter some data - there are a few ways to do this. Because we've build this app to be a CRUD app, we can simply create some Projects, Galleries, and add our Images with a front-end interface, or an app that handles our HTTP requests. For my purposes, I have a set of data that is required and provided so I've prepped a seed file to populate the database tables mapped to their appropriate associations.
The file can be found here: https://github.com/firesoflife/backend_m-woodworks/blob/71a791b5c8c4f46efac8ded5a09242dbccc982e9/db/seeds.rb#L1

For the sake of brevity, I won't go over testing our actions and routes here. I usually reach for a tool like Postman to test my HTTP requests.

## Update - Data Fetching, Front-End Nightmares and Serializer Saviours

Ok, Before you get excited about all this and start building out your front end, let me save you a head-ache. I spend days ... yes, days, trying to make my models "mesh" in React and without some fancy pants javascript and and excessive number of requests to the server, parsing out the data isn't easy. I'm sure it's possible, but after some time, and remembering some content I'd come across using Serializers, this seems the most logical route.

### Active Model Serializer

What is it? Think of it as a way to return all your model data you created in Rails with all of its associations in a neatly organized JSON file. Seeing it in action will make more sense. The main problem before using a serializer in my Rails API
was that my association were present in the database, but upon fetching the data in the front end, the data fetched renders as decoupled forcing further requests and more javascript to bring them together. The returned JSON via a serializer will allow us to rejoin our associated models via nested objects. Let's get into it.

1. The first thing to do is to add our Serializer Gem to our Gemfile

- Add this to the Gemfile `gem 'active_model_serializers', '~> 0.10.13'`
- now run `bundle` in your terminal

2. run the generator for all the models in all the terminal

- rails g serializer user
- rails g serializer gallery
- rails g serializer image
- rails g serializer project

3. If your rails server is running, stop it and give it a restart or your new serializers won't be recognized and you'll find yourself debugging a non-existent problem for 10 minutes, like I did. Now when you fetch your data, it will appear as though we lost all our exposed endpoints except for the id. Let's fix that.

4. In the `project_serializer.rb` lets add some attributes to expose to our front end application. Edit the file to look as follows:

```
class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :project_tags, :project_type, :description
end
```

5. Add our association to the `project_serializer.rb` so we can get acess to our gallery data in the same http request. The file will now loo like this:

```
class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :project_tags, :project_type, :description

  has_one :gallery
end
```

6. Change the `gallery_serializer.rb` so that it exposes the parts of the object we need, as follows:

```
class GallerySerializer < ActiveModel::Serializer
  attributes :id, :cover_image_url, :project_id, :alt_text, :title

  has_many :images
end
```

Now, when we make a request to our projects endpoint we should see something magical has occurred. Use a fetch client if you want, or just navigate to your projects route in the browser. You will now see your Project object with your gallery object nested beneath it - super easy to work with in the front-end.

7. The default behaviour of a serializer is to only nest objects one level deep, so if we want to have our arrays of images nested under the gallery, we need to either create an initializer for our serializer or, or to tell our project controller what we want to include in the render:

_Method One - create an intializer_

```
# /config/initializers/active_model_serializer.rb
ActiveModelSerializers.config.default_includes = '**'
```

_Method Two - change the `project_controller.rb`, `index` and `show` methods_:

```
# app/controlers/projects_controller.rb

def index
  @projects = Project.all

  render json: @projects, include: ['images', 'gallery.images']
end

def show
  render json: @project, include: ['images', 'gallery.images']
end
```

I've opted for method two in my implementation.

... And that's it. Fetching our data will become a whole lot easier now. In the second part of this article, we will bring the beauty of serilizers to our Users model.

## Part II -- Coming soon

In part 2, we will create and make associations for a user authentication
