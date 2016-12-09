class Client
  attr_reader(:name, :phone, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  # Create
  define_method(:save) do
    DB.exec("INSERT INTO clients (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', #{@stylist_id})")
  end

  # Read
  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients")
    all_clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      phone = client.fetch('phone')
      stylist_id = client.fetch('stylist_id').to_i
      all_clients.push(Client.new({:name => name, :phone => phone, :stylist_id => stylist_id}))
    end
    all_clients
  end

  # Update

  # Delete


  # Double equals modify for RSpec
  define_method(:==) do |other_client|
    self.name().==(other_client.name()).&(self.phone().==(other_client.phone())).&(self.stylist_id().==(other_client.stylist_id()))
  end

end
