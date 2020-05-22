require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/project')
require('./lib/volunteer')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to ('/tracker')
end

get('/tracker') do
  erb(:index)
end

get('/tracker/volunteer') do
  @projects = Project.all
  erb(:volunteer_list)
end

get('/tracker/projects') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end
