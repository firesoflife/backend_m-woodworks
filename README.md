# M-Woodworks BackEnd API for React App

## Build References

Authentication

- https://www.bluebash.co/blog/rails-6-7-api-authentication-with-jwt/

Associations

-
- https://joshfrankel.me/blog/create-a-many-to-many-activerecord-association-in-ruby-on-rails/

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

   - Build the Gallery model by running `rails g model gallery image_url cover_image_url`
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

    render json: @galleries
   end


   # GET /galleries/1

   def show
   render json: @project
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

You should now have all your models and controllers set up
