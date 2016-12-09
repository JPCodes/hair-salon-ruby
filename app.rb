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
  erb(:new_client)
end

post('/new_client') do
  @client_name = params.fetch('client_name')
  @client_phone = params.fetch('client_phone')
  Client.new({:name => @client_name, :phone => @client_phone, :stylist_id => 0, :id => nil}).save()
  erb(:clients)
end
# End Add Clients

# Stylists
get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end
