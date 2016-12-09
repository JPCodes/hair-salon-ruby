require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})

# Home
get('/') do
  erb(:index)
end

# Clients
get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end

# Add Clients
get('/clients/new') do
  
end

# Stylists
get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end
