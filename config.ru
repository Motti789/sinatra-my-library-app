require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# In order to Patch and Delete requets..
use Rack::MethodOverride

# here is where I will mount other controllers with 'use' 
run ApplicationController
