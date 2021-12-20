require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# In order to Patch and Delete requets..
use Rack::MethodOverride

# here is where I will mount other controllers with 'use' 
use UsersController
use BookEntriesController
run ApplicationController
