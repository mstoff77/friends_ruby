rails g controller <controller name> <action name>
rails g scaffold <scaffold name> <scaffold values one by one>
rails db:migrate    

after adding gem devise do,

Getting started

Devise 4.0 works with Rails 4.1 onwards. Add the following line to your Gemfile:

gem 'devise'

Then run bundle install

Next, you need to run the generator:

$ rails generate devise:install
$ rails generate devise:views

At this point, a number of instructions will appear in the console. Among these instructions, you'll need to set up the default URL options for the Devise mailer in each environment. Here is a possible configuration for config/environments/development.rb:

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

The generator will install an initializer which describes ALL of Devise's configuration options. It is imperative that you take a look at it. When you are done, you are ready to add Devise to any of your models using the generator.

In the following command you will replace MODEL with the class name used for the application’s users (it’s frequently User but could also be Admin). This will create a model (if one does not exist) and configure it with the default Devise modules. The generator also configures your config/routes.rb file to point to the Devise controller.

$ rails generate devise MODEL

Next, check the MODEL for any additional configuration options you might want to add, such as confirmable or lockable. If you add an option, be sure to inspect the migration file (created by the generator if your ORM supports them) and uncomment the appropriate section. For example, if you add the confirmable option in the model, you'll need to uncomment the Confirmable section in the migration.

Then run rails db:migrate

You should restart your application after changing Devise's configuration options (this includes stopping spring). Otherwise, you will run into strange errors, for example, users being unable to login and route helpers being undefined.
Controller filters and helpers

Devise will create some helpers to use inside your controllers and views. To set up a controller with user authentication, just add this before_action (assuming your devise model is 'User'):

before_action :authenticate_user!

For Rails 5, note that protect_from_forgery is no longer prepended to the before_action chain, so if you have set authenticate_user before protect_from_forgery, your request will result in "Can't verify CSRF token authenticity." To resolve this, either change the order in which you call them, or use protect_from_forgery prepend: true.

If your devise model is something other than User, replace "_user" with "_yourmodel". The same logic applies to the instructions below.

To verify if a user is signed in, use the following helper:

user_signed_in?

For the current signed-in user, this helper is available:

current_user

You can access the session for this scope:

user_session

After signing in a user, confirming the account or updating the password, Devise will look for a scoped root path to redirect to. For instance, when using a :user resource, the user_root_path will be used if it exists; otherwise, the default root_path will be used. This means that you need to set the root inside your routes:

root to: 'home#index'

You can also override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.

Notice that if your Devise model is called Member instead of User, for example, then the helpers available are:

before_action :authenticate_member!

member_signed_in?

current_member

member_session




After That Add Associations BW User And Friendlists table 


rails g migration add_user_id_to_friends_lists user_id:integer:index