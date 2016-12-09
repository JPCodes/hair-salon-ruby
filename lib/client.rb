class Client
  attr_reader(:id, :name, :phone, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  # Create
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  # Read
  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients")
    all_clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      phone = client.fetch('phone')
      stylist_id = client.fetch('stylist_id').to_i
      id = client.fetch('id').to_i
      all_clients.push(Client.new({:name => name, :phone => phone, :stylist_id => stylist_id, :id => id}))
    end
    all_clients
  end

  # Update
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @phone = attributes.fetch(:phone, @phone)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
  end

  # Delete
  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  # Find by ID
  define_singleton_method(:find) do |id_num|
    returned_clients = Client.all()
    found_client = nil
    returned_clients.each() do |client|
      if client.id() == id_num
        found_client = client
      end
    end
    found_client
  end


  # Double equals modify for RSpec
  define_method(:==) do |other_client|
    self.name().==(other_client.name()).&(self.phone().==(other_client.phone())).&(self.stylist_id().==(other_client.stylist_id()))
  end

end
