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

# Start Clients Routing
# All Clients View
get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end
# End All Clients View

# Add Clients
get('/clients/new') do
  erb(:new_client)
end

post('/new_client') do
  @client_name = params.fetch('client_name')
  @client_phone = params.fetch('client_phone')
  Client.new({:name => @client_name, :phone => @client_phone, :stylist_id => 0, :id => nil}).save()
  @all_clients = Client.all()
  erb(:clients)
end
# End Add Clients

# Individual Client Pages
get('/client/:id') do
  @current_client = Client.find(params.fetch('id').to_i)
  erb(:client)
end

patch("/client/:id") do
  @current_client = Client.find(params.fetch("id").to_i())
  new_name = params.fetch('new_name')
  @current_client.update({:name => new_name})
  @all_clients = Client.all()
  erb(:client)
end

delete("/client/:id") do
  @curren_client = Client.find(params.fetch("id").to_i())
  @curren_client.delete()
  erb(:index)
end
# End Individual Client Pages
# End Clients Routing

# Start Stylists Routing
# All Stylists View
get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end
# End All Stylists View

# Add Stylists
get('/stylists/new') do
  erb(:new_stylist)
end

post('/new_stylist') do
  @stylist_name = params.fetch('stylist_name')
  Stylist.new({:id => nil, :name => @stylist_name}).save()
  @all_stylists = Stylist.all()
  erb(:stylists)
end
# End Add Stylists

# Individual Stylist Pages
get('/stylist/:id') do
  @current_stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

patch("/stylist/:id") do
  @current_stylist = Stylist.find(params.fetch("id").to_i())
  new_name = params.fetch('new_name')
  @current_stylist.update({:name => new_name})
  @all_stylists = Stylist.all()
  erb(:stylist)
end

delete("/stylist/:id") do
  @curren_stylist = Stylist.find(params.fetch("id").to_i())
  @curren_stylist.delete()
  erb(:index)
end
# End Individual Stylist Pages
# End Stylists Routing
