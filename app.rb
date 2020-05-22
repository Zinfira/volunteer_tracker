require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/project')
require('./lib/volunteer')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})


