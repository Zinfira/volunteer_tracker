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
  erb(:list_for_volunteer)
end

get('/tracker/projects') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

post('/tracker/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all
  @volunteers = Volunteer.all
  redirect to ('/tracker/projects')
end

get('/tracker/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @volunteers = Volunteer.all
  @show = params[:show]
  erb(:project)
end

get('/tracker/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  @volunteers = @project.volunteers

  erb(:edit_project)
end

patch('/tracker/projects/:id') do
  project = Project.find(params[:id].to_i)
  project.update({:title => params[:new_title], :id => nil})
  @projects = Project.all
  @show = false
  erb(:project)
end

delete('/tracker/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete()
  @projects = Project.all
  erb(:projects)
end

get('/tracker/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/tracker/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id])
  @project = Project.find(params[:id])
  erb(:volunteer)
end

patch('/tracker/projects/:id/volunteers/:volunteer_id') do
  volunteer = Volunteer.find(params[:volunteer_id])
  volunteer.update({:name => params[:name], :project_id => @project_id, :id => nil})
  @project = Project.find(params[:id])
  erb(:project)
end

post("/tracker/projects/:id/volunteers") do
  @project = Project.find(params[:id].to_i)
  name = params[:new_volunteer]
  volunteer = Volunteer.new({:name => name, :project_id => @project.id, :id => nil})
  volunteer.save
  erb(:project)
end

delete('/tracker/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id])
  @volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end




