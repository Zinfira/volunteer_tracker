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

post('/tracker/projects') do
  title = params[:new_project]
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all
  erb(:projects)
end

get('/tracker/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('/tracker/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/tracker/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:new_project])
  @projetss = Project.all
  erb(:projects)
end

delete('/tracker/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()

  erb(:projects)
end